# Dotfiles

My macOS dotfiles. The previous Arch/i3 setup lives on the `linux-final` tag.

## Setup

Install [Homebrew](https://brew.sh):

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then clone this repo and run the install script to install dependencies and create symlinks:

```bash
git clone https://github.com/silvanob/dotfiles.git ~/dotfiles
cd ~/dotfiles && chmod +x install.sh && ./install.sh
```

## Tools

- **zsh** + **starship** prompt, **fzf** (`Ctrl+T` files, `Ctrl+R` history), `fd`, `ripgrep`, zsh-autosuggestions (`Ctrl+F` to accept)
- **tmux** — prefix `Ctrl+A`, vi keys, tpm plugins (resurrect, continuum, vim-tmux-navigator)
- **Neovim** — Lua config with lazy.nvim: LSP (mason), blink.cmp, telescope, harpoon, treesitter, conform, gruvbox
- **fastfetch** — system info on shell start
- **Karabiner-Elements** — caps lock/escape swap, Finder forward-delete to Trash
- **IdeaVim** — JetBrains vim bindings

## Symlinks

| Dotfile | Target |
|---------|--------|
| `zsh/.zshrc` | `~/.zshrc` |
| `tmux/.tmux.conf` | `~/.tmux.conf` |
| `ideavim/.ideavimrc` | `~/.ideavimrc` |
| `starship/.config/starship.toml` | `~/.config/starship.toml` |
| `nvim/.config/nvim` | `~/.config/nvim` |
| `fastfetch/.config/fastfetch` | `~/.config/fastfetch` |
| `karabiner/.config/karabiner/karabiner.json` | `~/.config/karabiner/karabiner.json` |
