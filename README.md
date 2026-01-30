# dotfiles

Personal development environment configuration for macOS.

## What's Included

- **Zsh** - Shell configuration
- **Alacritty** - GPU-accelerated
- **Tmux** - Terminal multiplexer
- **Neovim** - Modern text editor

## Prerequisites

### Install Homebrew (if not already installed)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After installation, follow the on-screen instructions to add Homebrew to your PATH.

### Install Core Applications

```bash
brew install --cask alacritty
brew install neovim tmux
```

## Complete Installation Guide

### Step 1: Install System Dependencies

```bash
brew install font-hack-nerd-font \
  powerlevel10k \
  ripgrep fd \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  nvm git
```

### Step 2: Install Optional Dependencies

```bash
brew install font-fira-code-nerd-font \
  font-jetbrains-mono-nerd-font \
  font-meslo-lg-nerd-font

brew install dotnet
dotnet tool install -g csharpier
```

### Step 3: Clone and Install Dotfiles

```bash
git clone https://github.com/zakkoo/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
chmod +x install.sh
./install.sh
```

The install script will:
- Create necessary directories
- Backup existing configurations (with timestamps)
- Create symlinks to your dotfiles
- Install TPM (Tmux Plugin Manager) automatically

### Step 4: Install Node.js Global Packages

```bash
npm install -g @fsouza/prettierd \
  prettier eslint
```

### Step 5: Post-Installation Setup

#### Alacritty Themes (Optional)

```bash
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme.git ~/.config/alacritty/themes
```

#### Powerlevel10k Configuration

```bash
p10k configure
```

#### Tmux Plugin Installation

Inside tmux, press: `prefix + I` (capital i) to install all plugins.

#### Neovim Setup

Launch Neovim with `nvim`. On first launch, lazy.nvim will automatically bootstrap and install all plugins. Wait for completion and restart if needed.

## Updating

Since configs are symlinked, just pull the latest changes:

```bash
cd ~/.dotfiles
git pull
```

Changes take effect:
- **Alacritty**: Immediately (live reload enabled)
- **Zsh**: After `source ~/.zshrc` or terminal restart
- **Tmux**: After `prefix + r` (reloads config automatically)
- **Neovim**: After restart or `:source $MYVIMRC`

## Verification

Run the verification script to check your installation:

```bash
./verify.sh
```

## Uninstalling

```bash
rm ~/.zshrc
rm -rf ~/.config/alacritty ~/.config/nvim
rm ~/.tmux.conf
rm -rf ~/.dotfiles
```

Backups are created in the same directory as the original files with `.backup.YYYYMMDD_HHMMSS` suffix. To restore:

```bash
mv ~/.zshrc.backup.YYYYMMDD_HHMMSS ~/.zshrc
```
