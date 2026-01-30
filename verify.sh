#!/bin/bash

echo "=== Verifying Dotfiles Installation ==="
echo

# Check applications
echo "Checking installed applications..."
command -v alacritty >/dev/null 2>&1 && echo "✓ Alacritty installed" || echo "✗ Alacritty not found"
command -v nvim >/dev/null 2>&1 && echo "✓ Neovim installed" || echo "✗ Neovim not found"
command -v tmux >/dev/null 2>&1 && echo "✓ Tmux installed" || echo "✗ Tmux not found"
echo

# Check symlinks
echo "Checking symlinks..."
[ -L ~/.zshrc ] && echo "✓ ~/.zshrc symlinked" || echo "✗ ~/.zshrc not symlinked"
[ -L ~/.config/nvim ] && echo "✓ ~/.config/nvim symlinked" || echo "✗ ~/.config/nvim not symlinked"
[ -L ~/.tmux.conf ] && echo "✓ ~/.tmux.conf symlinked" || echo "✗ ~/.tmux.conf not symlinked"
[ -f ~/.config/alacritty/alacritty.toml ] && echo "✓ Alacritty config exists" || echo "✗ Alacritty config missing"
echo

# Check fonts
echo "Checking fonts..."
fc-list | grep -q "Hack Nerd Font" && echo "✓ Hack Nerd Font installed" || echo "✗ Hack Nerd Font not found"
echo

# Check Neovim version
echo "Checking Neovim version..."
nvim --version | head -n1

# Check Node.js
echo
echo "Checking Node.js..."
command -v node >/dev/null 2>&1 && node --version || echo "✗ Node.js not found"
command -v npm >/dev/null 2>&1 && npm --version || echo "✗ npm not found"

echo
echo "=== Verification Complete ==="
