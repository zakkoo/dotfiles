#!/bin/bash
# Dotfiles installation script
# Creates symlinks from home directory to dotfiles repo

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

DOTFILES_DIR="$HOME/.dotfiles"

echo -e "${BLUE}Installing dotfiles...${NC}\n"

# Backup existing files
backup_if_exists() {
    if [ -f "$1" ] || [ -d "$1" ]; then
        if [ ! -L "$1" ]; then
            echo -e "${BLUE}Backing up existing $1${NC}"
            mv "$1" "$1.backup.$(date +%Y%m%d_%H%M%S)"
        fi
    fi
}

# Create symlink
create_symlink() {
    local source="$1"
    local target="$2"

    if [ -L "$target" ]; then
        rm "$target"
    fi

    backup_if_exists "$target"

    mkdir -p "$(dirname "$target")"
    ln -sf "$source" "$target"
    echo -e "${GREEN}✓${NC} Linked $target"
}

# Zsh
create_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

# Alacritty
create_symlink "$DOTFILES_DIR/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"

# Tmux
if [ -f "$DOTFILES_DIR/tmux/.tmux.conf" ]; then
    # Install TPM (Tmux Plugin Manager) if not already installed
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        echo -e "${BLUE}Installing TPM (Tmux Plugin Manager)...${NC}"
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        echo -e "${GREEN}✓${NC} TPM installed"
    fi

    create_symlink "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

    # Reload tmux config if tmux is running
    if command -v tmux &> /dev/null && tmux info &> /dev/null 2>&1; then
        tmux source-file ~/.tmux.conf
        echo -e "${GREEN}✓${NC} Reloaded tmux configuration"
    fi
fi

# Neovim
create_symlink "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

echo -e "\n${GREEN}✓ Dotfiles installation complete!${NC}"
echo -e "${BLUE}Note: Restart your terminal or run 'source ~/.zshrc' to apply changes${NC}"

# Additional notes
if [ -f "$DOTFILES_DIR/tmux/.tmux.conf" ]; then
    echo -e "${BLUE}Tmux: Press prefix + I (capital i) inside tmux to install plugins${NC}"
fi
