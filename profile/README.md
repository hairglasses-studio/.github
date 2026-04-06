## Hairglasses Studio

![Go](https://img.shields.io/badge/Go-1.26-00ADD8?logo=go&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-5-3178C6?logo=typescript&logoColor=white)
![Python](https://img.shields.io/badge/Python-3.12-3776AB?logo=python&logoColor=white)
![MCP](https://img.shields.io/badge/MCP-2025--11--25-8A2BE2)
![License](https://img.shields.io/badge/License-MIT-green)

Production Go tooling for MCP servers, AI agent infrastructure, and desktop automation.

Production-grade MCP toolkit and desktop automation. Built by [@hairglasses](https://github.com/hairglasses).

## Key Repos

| Repo | Description |
|------|-------------|
| [mcpkit](https://github.com/hairglasses-studio/mcpkit) | Production Go toolkit for MCP servers, middleware, workflows, and evaluation. |
| [ralphglasses](https://github.com/hairglasses-studio/ralphglasses) | Multi-LLM orchestration TUI for Claude, Gemini, and Codex sessions. |
| [dotfiles](https://github.com/hairglasses-studio/dotfiles) | Desktop automation, Hyprland/macOS environment management, and large MCP surfaces. |
| [claudekit](https://github.com/hairglasses-studio/claudekit) | Agent and terminal customization framework for Claude Code and Codex workflows. |

### Architecture

**[ralphglasses](https://github.com/hairglasses-studio/ralphglasses)** -- Multi-LLM agent orchestration TUI. Manages parallel Claude, Gemini, and Codex sessions from a single k9s-style interface with 126 MCP tools. Built with [Charmbracelet](https://github.com/charmbracelet) (BubbleTea + Lip Gloss).

**[dotfiles](https://github.com/hairglasses-studio/dotfiles)** -- Cyberpunk desktop rice with 138+ GLSL shaders, 1,400+ MCP tools (7 Go + 3 JS servers), Hyprland compositor abstraction, and eww status bars.

**[claudekit](https://github.com/hairglasses-studio/claudekit)** -- Claude Code terminal customization framework: themes, hooks, skills, and agent configuration.

## All Repositories

| Repo | Description |
|------|-------------|
| [mcpkit](https://github.com/hairglasses-studio/mcpkit) | Production Go MCP toolkit (35+ packages, 700+ tests) |
| [ralphglasses](https://github.com/hairglasses-studio/ralphglasses) | Multi-LLM agent orchestration TUI (126 MCP tools) |
| [claudekit](https://github.com/hairglasses-studio/claudekit) | Claude Code terminal customization framework |
| [dotfiles](https://github.com/hairglasses-studio/dotfiles) | Desktop config, 138+ GLSL shaders, 1,400+ MCP tools |
| [dotfiles-mcp](https://github.com/hairglasses-studio/dotfiles-mcp) | Desktop environment MCP server (82 tools) |
| [systemd-mcp](https://github.com/hairglasses-studio/systemd-mcp) | Systemd management MCP server |
| [tmux-mcp](https://github.com/hairglasses-studio/tmux-mcp) | Tmux multiplexer MCP server |
| [process-mcp](https://github.com/hairglasses-studio/process-mcp) | Process debugging MCP server |
| [prompt-improver](https://github.com/hairglasses-studio/prompt-improver) | 13-stage prompt enhancement pipeline |

## Focus Areas

- **MCP servers** -- Go-native servers built on mcpkit, covering desktop automation, system management, and developer tooling
- **Agent orchestration** -- Multi-provider LLM fleet management with cost tracking and parallel execution
- **Desktop automation** -- Hyprland/Wayland control, GLSL shader pipelines, input device management via MCP

All Go projects target Go 1.26+ and follow the [MCP 2025-11-25 specification](https://modelcontextprotocol.io/specification/2025-11-25).
