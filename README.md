# dotfiles

Personal dotfiles for WSL2 Ubuntu environment.

## Contents

| File | Description |
|------|-------------|
| `.tmux.config` | tmux config — vi keys, clipboard via `clip.exe`, mouse support |
| `.config/nvim/` | Neovim config (LazyVim) |

## Neovim

LazyVim starter with:

- **avante.nvim** — AI assistant using Claude (`claude-sonnet-4-6`)
  - Forces HTTP/1.1 to avoid curl exit 92 (WSL2 HTTP/2 stream issue)
  - Fixes `text_editor` tool type for claude-sonnet-4-6 compatibility
  - Keymaps: `<Space>aa` ask, `<Space>ae` edit, `<Space>at` toggle, `<Space>ar` refresh
- **clangd** — C/C++ LSP via Mason

## tmux

- Vi copy mode (`v` to select, `y` to copy to Windows clipboard via `clip.exe`)
- Mouse enabled

## Notes

- `ANTHROPIC_API_KEY` is set in `~/.bashrc` (not committed)
- Platform: WSL2, shell: bash
