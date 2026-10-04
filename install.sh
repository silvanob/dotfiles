#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Installing brew packages..."

# Terminal essentials
brew install neovim tmux starship fzf ripgrep fd fastfetch

# Languages
brew install python go node nvm pyenv openjdk
brew install --cask dotnet-sdk

# Web & search
brew install w3m ddgr tldr

# API & dev tools
brew install xh jq

# Shell plugins
brew install zsh-autosuggestions

# Keyboard remapping
brew install --cask karabiner-elements

echo "==> Running post-install setup..."

# Java: link into system JVM directory so /usr/libexec/java_home picks it up
sudo ln -sfn "$(brew --prefix)/opt/openjdk/libexec/openjdk.jdk" /Library/Java/JavaVirtualMachines/openjdk.jdk

# tmux plugin manager (press prefix + I inside tmux to install plugins)
[ -d ~/.tmux/plugins/tpm ] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "==> Creating symlinks..."

mkdir -p ~/.config

ln -sfn "$DOTFILES/zsh/.zshrc" ~/.zshrc
ln -sfn "$DOTFILES/tmux/.tmux.conf" ~/.tmux.conf
ln -sfn "$DOTFILES/ideavim/.ideavimrc" ~/.ideavimrc
ln -sfn "$DOTFILES/starship/.config/starship.toml" ~/.config/starship.toml
# whole config directories
ln -sfn "$DOTFILES/nvim/.config/nvim" ~/.config/nvim
ln -sfn "$DOTFILES/fastfetch/.config/fastfetch" ~/.config/fastfetch

# karabiner: only the json, since the directory also holds automatic backups
mkdir -p ~/.config/karabiner
ln -sfn "$DOTFILES/karabiner/.config/karabiner/karabiner.json" ~/.config/karabiner/karabiner.json

echo ""
echo "Done! Next steps:"
echo "  1. Restart your shell or run: source ~/.zshrc"
echo "  2. Open nvim — lazy.nvim will install plugins automatically"
echo "  3. Run :MasonUpdate inside nvim to confirm all LSP servers are installed"
echo "  4. In tmux, press prefix + I to install tmux plugins"
