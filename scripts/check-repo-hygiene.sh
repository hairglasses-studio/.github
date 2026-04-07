#!/usr/bin/env bash
set -euo pipefail

require_roadmap=0
require_makefile=0
require_codeowners=1
max_root_docs=8
allow_extra_docs=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --require-roadmap) require_roadmap=1 ;;
    --require-makefile) require_makefile=1 ;;
    --no-require-codeowners) require_codeowners=0 ;;
    --max-root-docs)
      shift
      max_root_docs="${1:?missing value for --max-root-docs}"
      ;;
    --allow-extra-docs)
      shift
      allow_extra_docs="${1:-}"
      ;;
    *)
      echo "unknown argument: $1" >&2
      exit 2
      ;;
  esac
  shift
done

fail() {
  echo "::error::$1" >&2
  exit 1
}

require_file() {
  local path="$1"
  [[ -f "$path" ]] || fail "Missing required file: $path"
}

require_dir() {
  local path="$1"
  [[ -d "$path" ]] || fail "Missing required directory: $path"
}

require_file "README.md"
require_file "LICENSE"
require_file "AGENTS.md"
require_file "CLAUDE.md"
require_file "GEMINI.md"
require_dir ".github/workflows"

if [[ "$require_roadmap" -eq 1 ]]; then
  require_file "ROADMAP.md"
fi

if [[ "$require_makefile" -eq 1 ]]; then
  require_file "Makefile"
fi

if [[ "$require_codeowners" -eq 1 ]]; then
  if [[ ! -f ".github/CODEOWNERS" && ! -f "CODEOWNERS" ]]; then
    fail "Missing CODEOWNERS"
  fi
fi

if git ls-files --error-unmatch coverage.out >/dev/null 2>&1; then
  fail "coverage.out should not be committed"
fi
if git ls-files --error-unmatch coverage.html >/dev/null 2>&1; then
  fail "coverage.html should not be committed"
fi

if [[ -d ".codex/agents" ]] && find .codex/agents -maxdepth 1 -type f -name '*.toml' | grep -q .; then
  while IFS= read -r codex_agent; do
    base="$(basename "$codex_agent" .toml)"
    require_file ".claude/agents/${base}.md"
    require_file ".gemini/commands/${base}.toml"
  done < <(find .codex/agents -maxdepth 1 -type f -name '*.toml' | sort)
fi

declare -A allowed_docs=(
  ["AGENTS.md"]=1
  ["CLAUDE.md"]=1
  ["GEMINI.md"]=1
  ["README.md"]=1
  ["ROADMAP.md"]=1
  ["CHANGELOG.md"]=1
  ["CONTRIBUTING.md"]=1
  ["SECURITY.md"]=1
  ["CODE_OF_CONDUCT.md"]=1
  ["REVIEW.md"]=1
  ["ARCHITECTURE.md"]=1
  ["RESUME.md"]=1
)

IFS=',' read -r -a extras <<< "$allow_extra_docs"
for extra in "${extras[@]}"; do
  [[ -n "$extra" ]] && allowed_docs["$extra"]=1
done

doc_count=0
unexpected_docs=()
while IFS= read -r path; do
  file="$(basename "$path")"
  ((doc_count += 1))
  if [[ -z "${allowed_docs[$file]:-}" ]]; then
    unexpected_docs+=("$file")
  fi
done < <(find . -maxdepth 1 -type f -name '*.md' -printf '%P\n' | sort)

if (( doc_count > max_root_docs )); then
  fail "Root markdown file count ${doc_count} exceeds limit ${max_root_docs}"
fi

if (( ${#unexpected_docs[@]} > 0 )); then
  fail "Unexpected root markdown files: ${unexpected_docs[*]}"
fi

echo "Repo hygiene checks passed."
