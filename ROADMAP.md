# .github Roadmap

Last updated: 2026-04-08.

## Current State

Org-wide reusable workflows, workflow templates, and default community health files.

- Tier: `org-platform`
- Lifecycle: `active`
- Language profile: `Shell/Markdown/YAML`
- Visibility / sensitivity: `PUBLIC` / `public`
<!-- whiteclaw-rollout:start -->
## Whiteclaw-Derived Overhaul (2026-04-08)

This tranche applies the highest-value whiteclaw findings that fit this repo's real surface: engineer briefs, bounded skills/runbooks, searchable provenance, scoped MCP packaging, and explicit verification ladders.

### Strategic Focus
- Treat this repo as the org-standard workflow and template layer, not as another autonomy sandbox.
- Backport only the whiteclaw patterns that improve reuse and drift detection: engineer-brief templates, MCP smoke templates, and roadmap linting workflows.
- The first shared enforcement step is now in place through `repo-hygiene`; the next work is expanding from that narrow gate instead of inventing parallel workflow families.
- Keep the repo lean: workflow productization beats repo-local telemetry or prompt-pack sprawl.

### Recommended Work
- [x] [Workflows] Extend the shared `repo-hygiene` workflow with an opt-in whiteclaw rollout block requirement and prove it in `docs` first.
- [x] [Workflows] Add reusable `surfacekit-sync` and MCP smoke-test workflow templates so downstream repos can enforce the next rollout tranche through one shared implementation.
- [ ] [Templates] Promote the docs-side engineer-brief, prompt/runbook, and repo-surface templates into shared org workflow/template consumption paths.
- [ ] [Drift] Add a workflow that fails when public or active repos drift from the org instruction, roadmap, or manifest contract.
- [ ] [Policy] Document when a repo should get a local `.mcp.json`, a local skill, a prompt/runbook pack, or only archive-safe provenance updates.
- [ ] [Release] Keep workflow-template docs and examples aligned with the real reusable workflows so downstream adoption does not depend on shell archaeology.

### Rationale Snapshot
- Tier / lifecycle: `org-platform` / `active`
- Language profile: `Shell/Markdown/YAML`
- Visibility / sensitivity: `PUBLIC` / `public`
- Surface baseline: AGENTS=yes, skills=yes, codex=yes, mcp_manifest=missing, ralph=no, roadmap=yes
- Whiteclaw transfers in scope: workflow templates, roadmap linting, engineer-brief templates, MCP smoke-test templates
- Live repo notes: AGENTS, skills, Codex config, 19 workflow(s)

<!-- whiteclaw-rollout:end -->
