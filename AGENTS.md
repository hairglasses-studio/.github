# hairglasses-studio/.github — Agent Instructions

> Canonical instructions: AGENTS.md

Shared GitHub organization repo for workflow templates, reusable automation, policy docs, and Codex migration guidance.

## Working Rules

- Treat `workflow-templates/` as the canonical source for shared GitHub Actions files propagated into other repos.
- Keep Claude and Codex workflow templates structurally parallel unless a documented provider capability gap requires divergence.
- Store migration guidance under `docs/codex-migration/` and keep command examples aligned with the actual scripts in `dotfiles/` and `docs/`.
- Avoid repo-specific assumptions in shared templates. Defaults here should work across the org or be clearly documented as opt-in.

## Verification

- Review workflow templates before syncing them into other repos.
- Keep secret names stable across templates and helper scripts.
- Prefer artifact-first Codex workflows over comment-only automation for audits and structured findings.

## High-Value Paths

- `workflow-templates/`
- `docs/codex-migration/`
- `scripts/sync-secrets-from-1password.sh`
- `CONTRIBUTING.md`
