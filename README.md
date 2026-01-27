# dotfiles

Dotfiles managed with [yadm](https://yadm.io) - yet another dotfiles manager.

## Installation

Install yadm:
- macOS: `brew install yadm`
- Ubuntu: `apt install yadm`

Then clone and bootstrap:
```bash
yadm clone https://github.com/afittestide/dotfiles
```

Answer yes when asked to run bootstrap. It will install and configure everything.

## What's Included

### Shell
- **zsh** - shell with plugins via [antidote](https://getantibody.github.io/)
- **starship** - cross-shell prompt
- **direnv** - directory-specific environment variables
- **fzf** - fuzzy finder

### Terminal
- **tmux** - terminal multiplexer with [tpm](https://github.com/tmux-plugins/tpm)
- **vim-tmux-navigator** - seamless navigation between vim and tmux panes
- **tmux-resurrect** - persist and restore tmux sessions

### Neovim
Modern Lua-based config using native Neovim features:

**Plugins** (via native packages):
- **telescope.nvim** - fuzzy finder
- **nvim-treesitter** - syntax highlighting
- **vim-fugitive** - git integration

**LSP** (via native `vim.lsp`):
- Python (pyright)
- Ruby (solargraph)
- Go (gopls)
- TypeScript (ts_ls)
- Bash (bashls)

### Keymaps

Leader is `<Space>`

| Key | Action |
|-----|--------|
| `<C-p>` | Find git files |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>gs` | Git status (fugitive) |
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Hover docs |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |

### Tmux

Prefix is `<C-a>`

| Key | Action |
|-----|--------|
| `<prefix> \|` | Split vertically |
| `<prefix> -` | Split horizontally |
| `<prefix> x` | Kill pane |
| `<C-h/j/k/l>` | Navigate panes (works in vim too) |
| `<prefix> <C-s>` | Save session |
| `<prefix> <C-r>` | Restore session |

## Testing

Build and test with Docker:
```bash
docker build -t dotfiles-test .
docker run -it dotfiles-test
```

Run healthcheck:
```bash
docker run --rm dotfiles-test nvim --headless -c "checkhealth" -c "qa!"
```

## Troubleshooting

If bootstrap fails, please open an issue with the error output.
