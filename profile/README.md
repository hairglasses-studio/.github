## Hairglasses Studio

Production Go tooling for MCP servers, AI agent infrastructure, and desktop automation.

### Flagship Projects

| Project | Description |
|---------|-------------|
| **[mcpkit](https://github.com/hairglasses-studio/mcpkit)** | Go toolkit for production MCP servers — 36 packages, typed handlers, middleware chains, RBAC, circuit breakers, workflow engines, evaluation frameworks. 90%+ coverage, 100% MCP spec compliance. |
| **[ralphglasses](https://github.com/hairglasses-studio/ralphglasses)** | Multi-LLM agent orchestration TUI — parallel Claude/Gemini/Codex sessions, cost tracking, budget enforcement, autonomous R&D loops. 200 MCP tools. |
| **[dotfiles](https://github.com/hairglasses-studio/dotfiles)** | Full-stack dev environment — 138 GPU-rendered GLSL shaders, 1,400+ MCP tools (including [99-tool desktop automation server](https://github.com/hairglasses-studio/dotfiles/tree/main/mcp/dotfiles-mcp)), Hyprland/macOS desktop automation. |
| **[claudekit](https://github.com/hairglasses-studio/claudekit)** | Claude Code customization framework — fonts, themes, autonomous R&D cycles, budget-aware model routing. |

### Architecture

```
mcpkit (framework)
  ├── ralphglasses (orchestration TUI + 200 MCP tools)
  ├── claudekit (terminal customization + autonomous loops)
  └── dotfiles (environment config + 138 GLSL shaders + 99-tool MCP server)
```

All Go projects target Go 1.26+ and follow the [MCP 2025-11-25 specification](https://modelcontextprotocol.io/specification/2025-11-25).

### Contributing

See each project's CONTRIBUTING.md for guidelines. All projects are MIT licensed.
