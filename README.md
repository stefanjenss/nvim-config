# 💤 My LazyVim Config

Personal Neovim configuration based on [LazyVim](https://github.com/LazyVim/LazyVim) with Python development focus.

## Features

- 🐍 **Python-optimized:** Pyright LSP, Ruff linting, Black formatting
- 🔬 **IPython integration:** Send code to IPython REPL from Neovim
- ⚡ **LazyVim base:** Modern plugin manager, excellent defaults
- 🎨 **Clean structure:** Modular configuration, easy to customize

## Custom Keybindings

### Python Workflow
- `<leader>r` - Run current Python file in split terminal
- `<leader>pi` - Open IPython in split (uses .venv if available)
- `<leader>ps` - Send line/selection to IPython
- `<leader>pf` - Send entire file to IPython

See full keybinding guide in the [LazyVim docs](https://lazyvim.org).

## Installation

1. **Backup existing config:**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. **Clone this repo:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim
   ```

3. **Launch Neovim:**
   ```bash
   nvim
   ```
   Plugins will auto-install on first launch.

## Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lua/
│   ├── config/
│   │   ├── options.lua         # Vim options (Python settings)
│   │   ├── keymaps.lua         # Custom keymaps (IPython!)
│   │   ├── lazy.lua            # Plugin manager config
│   │   └── autocmds.lua        # Auto-commands
│   └── plugins/
│       └── python.lua          # Python LSP configuration
```

## Requirements

- Neovim >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (optional, for icons)
- Python 3 with `pynvim` package for Python features
- [ripgrep](https://github.com/BurntSushi/ripgrep) for telescope searching
- [LazyGit](https://github.com/jesseduffield/lazygit) (optional, for git UI)

## Credits

Built on [LazyVim](https://github.com/LazyVim/LazyVim) by [@folke](https://github.com/folke)
