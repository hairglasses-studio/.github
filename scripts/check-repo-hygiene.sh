#!/usr/bin/env bash
set -euo pipefail

require_roadmap=0
require_whiteclaw_rollout=0
require_makefile=0
require_codeowners=1
max_root_docs=8
allow_extra_docs=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --require-roadmap) require_roadmap=1 ;;
    --require-whiteclaw-rollout) require_whiteclaw_rollout=1 ;;
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
require_file ".claude/settings.json"
require_file ".gemini/settings.json"
require_dir ".github/workflows"

if [[ "$require_roadmap" -eq 1 ]]; then
  require_file "ROADMAP.md"
fi

if [[ "$require_whiteclaw_rollout" -eq 1 ]]; then
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
if git ls-files --error-unmatch CLAUDE.local.md >/dev/null 2>&1; then
  fail "CLAUDE.local.md must remain untracked"
fi
if git ls-files --error-unmatch AGENTS.override.md >/dev/null 2>&1; then
  fail "AGENTS.override.md must remain untracked unless a repo explicitly documents nested overrides"
fi

jq -e 'type == "object"' .claude/settings.json >/dev/null 2>&1 || \
  fail ".claude/settings.json must be valid JSON"
jq -e 'type == "object"' .gemini/settings.json >/dev/null 2>&1 || \
  fail ".gemini/settings.json must be valid JSON"
jq -e '(.context.fileName // []) | index("AGENTS.md") != null' .gemini/settings.json >/dev/null 2>&1 || \
  fail ".gemini/settings.json must bridge AGENTS.md via context.fileName"

if [[ -f ".mcp.json" ]]; then
  active_mcp_servers="$(jq -r '(.mcpServers // {}) | if type != "object" then {} else . end | with_entries(select(.key | startswith("_") | not)) | length' .mcp.json)"
  if [[ "$active_mcp_servers" -gt 0 ]]; then
    jq -e '(.mcpServers // {}) | type == "object"' .claude/settings.json >/dev/null 2>&1 || \
      fail ".claude/settings.json must expose repo MCP servers"
    jq -e '(.mcpServers // {}) | type == "object"' .gemini/settings.json >/dev/null 2>&1 || \
      fail ".gemini/settings.json must expose repo MCP servers"
    jq -e '(.mcpServers // {}) | keys | all(test("^[a-z0-9]+(-[a-z0-9]+)*$"))' .gemini/settings.json >/dev/null 2>&1 || \
      fail ".gemini/settings.json MCP server names must use kebab-case"
  fi
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

if [[ "$require_whiteclaw_rollout" -eq 1 ]]; then
  start_line="$(grep -n '^<!-- whiteclaw-rollout:start -->$' ROADMAP.md | head -1 | cut -d: -f1)"
  end_line="$(grep -n '^<!-- whiteclaw-rollout:end -->$' ROADMAP.md | head -1 | cut -d: -f1)"
  [[ -n "$start_line" ]] || fail "ROADMAP.md is missing <!-- whiteclaw-rollout:start -->"
  [[ -n "$end_line" ]] || fail "ROADMAP.md is missing <!-- whiteclaw-rollout:end -->"
  if (( end_line <= start_line )); then
    fail "Whiteclaw rollout markers are out of order in ROADMAP.md"
  fi

  block="$(sed -n "${start_line},${end_line}p" ROADMAP.md)"
  grep -q '^## Whiteclaw-Derived Overhaul ' <<<"$block" || fail "Whiteclaw rollout block must include the overhaul heading"
  grep -q '^### Strategic Focus$' <<<"$block" || fail "Whiteclaw rollout block must include ### Strategic Focus"
  grep -q '^### Recommended Work$' <<<"$block" || fail "Whiteclaw rollout block must include ### Recommended Work"
  grep -q '^### Rationale Snapshot$' <<<"$block" || fail "Whiteclaw rollout block must include ### Rationale Snapshot"
  grep -q 'Surface baseline:' <<<"$block" || fail "Whiteclaw rollout block must include a Surface baseline line"
  grep -q 'Whiteclaw transfers in scope:' <<<"$block" || fail "Whiteclaw rollout block must include a Whiteclaw transfers in scope line"
fi

echo "Repo hygiene checks passed."
