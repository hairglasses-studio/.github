## Hairglasses Studio

![Go](https://img.shields.io/badge/Go-1.26-00ADD8?logo=go&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-5-3178C6?logo=typescript&logoColor=white)
![Python](https://img.shields.io/badge/Python-3.12-3776AB?logo=python&logoColor=white)
![MCP](https://img.shields.io/badge/MCP-2025--11--25-8A2BE2)
![License](https://img.shields.io/badge/License-MIT-green)

Production Go tooling for MCP servers, AI agent infrastructure, and desktop automation. Built by [@hairglasses](https://github.com/hairglasses).

## Key Repos

| Repo | Description |
|------|-------------|
| [mcpkit](https://github.com/hairglasses-studio/mcpkit) | Production Go MCP toolkit — 72 packages, A2A bridge, multi-protocol gateway, 85%+ coverage |
| [ralphglasses](https://github.com/hairglasses-studio/ralphglasses) | Multi-LLM orchestration TUI — parallel Claude/Gemini/Codex sessions, 222 MCP tools |
| [dotfiles](https://github.com/hairglasses-studio/dotfiles) | Desktop config — 157 GLSL shaders, Hyprland/Sway, 1,400+ MCP tools |
| [python-marathon](https://github.com/hairglasses-studio/python-marathon) | Rustlings-style Python interview prep — 61+ exercises, pytest CLI runner |

### Architecture

**[mcpkit](https://github.com/hairglasses-studio/mcpkit)** — Production Go framework for MCP servers. 72 packages across 4 dependency layers: typed handlers, composable middleware, JWT/OAuth/DPoP auth, circuit breakers, FinOps budgeting, workflow engine with checkpointing, bidirectional MCP-A2A bridge, and multi-protocol gateway.

**[ralphglasses](https://github.com/hairglasses-studio/ralphglasses)** — Multi-LLM agent orchestration TUI. Manages parallel Claude, Gemini, and Codex sessions from a k9s-style interface with 222 MCP tools, cost tracking, and budget enforcement. Built with [Charmbracelet](https://github.com/charmbracelet) (BubbleTea + Lip Gloss).

**[dotfiles](https://github.com/hairglasses-studio/dotfiles)** — Cyberpunk desktop rice with 157 GLSL shaders, 1,400+ MCP tools (7 Go + 3 JS servers), Hyprland compositor abstraction, and eww status bars.

## All Repositories

| Repo | Description |
|------|-------------|
| [mcpkit](https://github.com/hairglasses-studio/mcpkit) | Production Go MCP toolkit (72 packages, 85%+ coverage) |
| [ralphglasses](https://github.com/hairglasses-studio/ralphglasses) | Multi-LLM agent orchestration TUI (222 MCP tools) |
| [dotfiles](https://github.com/hairglasses-studio/dotfiles) | Desktop config, 157 GLSL shaders, 1,400+ MCP tools |
| [python-marathon](https://github.com/hairglasses-studio/python-marathon) | Rustlings-style Python interview prep (61+ exercises) |
| [systemd-mcp](https://github.com/hairglasses-studio/systemd-mcp) | Systemd management MCP server |
| [tmux-mcp](https://github.com/hairglasses-studio/tmux-mcp) | Tmux multiplexer MCP server |
| [process-mcp](https://github.com/hairglasses-studio/process-mcp) | Process debugging MCP server |
| [codexkit](https://github.com/hairglasses-studio/codexkit) | Fleet management toolkit — baseline validation, skill sync, 12 MCP tools |

## Focus Areas

- **MCP servers** — Go-native servers built on mcpkit, covering desktop automation, system management, and developer tooling
- **Agent orchestration** — Multi-provider LLM fleet management with cost tracking and parallel execution
- **Desktop automation** — Hyprland/Wayland control, GLSL shader pipelines, input device management via MCP

All Go projects target Go 1.26+ and follow the [MCP 2025-11-25 specification](https://modelcontextprotocol.io/specification/2025-11-25).
