# Contributing

Use `AGENTS.md` in each repository as the canonical agent and automation contract.

## Shared Expectations

- Prefer the reusable workflows in `hairglasses-studio/.github` over bespoke commodity CI.
- Use `workflow-templates/surfacekit-sync.yml` for shared skill/provider/Codex parity enforcement through the canonical `codexkit` bridge, and `workflow-templates/mcp-smoke-test.yml` for the lightweight MCP smoke lane before adding repo-local variants.
- Keep repository-root docs focused on durable project docs. Session reports, research dumps, and ad hoc audits belong in `hairglasses-studio/docs` or a repo-local `docs/` directory.
- For MCP publish repos, treat the standalone repo as a mirror unless the repo-specific docs explicitly say otherwise.
- Avoid checked-in local artifacts such as `coverage.out`, generated binaries, or machine-specific config.

## Codex Config Baseline

Use the same committed Codex profile vocabulary across operator repos:

| Use case | Setting |
| --- | --- |
| Operator workstation default | Root config keeps `approval_policy = "on-request"` and `sandbox_mode = "workspace-write"` |
| Read-only analysis | `readonly_quiet` |
| Code review | `review` |
| Write-capable repo work | `workspace_auto` |
| Non-interactive CI | `ci_json` |

Policy notes:

- Keep repo-local config minimal and deterministic; personal high-permission overrides belong in user-global Codex config, not checked-in repo config.
- Only repos that actually own Codex hook automation should commit `[features] codex_hooks = true`. The current allowlist is `docs`, `dotfiles`, and `prompt-improver`.
- Structured Codex workflows should prefer artifact-first outputs and use prompt files from the shared `.github/.github/codex/prompts/` tree when possible.

## Validation

- Run the repo’s documented test/build path before opening a pull request.
- Update docs when public behavior, interfaces, release workflows, or repo topology change.
- Call out intentional drift from org standards in the pull request body.
