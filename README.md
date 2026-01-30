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
# Install Alacritty (GPU-accelerated terminal emulator)
brew install --cask alacritty

# Install Neovim (text editor)
brew install neovim

# Install Tmux (terminal multiplexer)
brew install tmux
```

## Complete Installation Guide

### Step 1: Install System Dependencies

```bash
# Required fonts (Nerd Fonts for icons and glyphs)
brew install font-hack-nerd-font

# Zsh theme for beautiful prompts
brew install powerlevel10k

# Required for Neovim Telescope (fuzzy finder)
brew install ripgrep fd

# Node Version Manager 
brew install nvm

# Git (required for plugin managers)
brew install git
```

### Step 2: Install Optional Dependencies

```bash
# Additional Nerd Fonts (optional alternatives)
brew install font-fira-code-nerd-font
brew install font-jetbrains-mono-nerd-font
brew install font-meslo-lg-nerd-font

# .NET SDK (required for C# development with csharpier)
brew install dotnet

# After .NET installation, install csharpier globally
dotnet tool install -g csharpier
```

### Step 3: Clone and Install Dotfiles

```bash
# Clone this repository
git clone https://github.com/zakkoo/dotfiles.git ~/.dotfiles

# Navigate to the directory
cd ~/.dotfiles

# Make the install script executable
chmod +x install.sh

# Run the installation
./install.sh
```

The install script will:
- Create necessary directories
- Backup existing configurations (with timestamps)
- Create symlinks to your dotfiles
- Install TPM (Tmux Plugin Manager) automatically

### Step 4: Install Node.js Global Packages

```bash
# Prettierd (faster Prettier formatter)
npm install -g @fsouza/prettierd

# Optional: Install other formatters/linters as needed
npm install -g prettier eslint
```

### Step 5: Post-Installation Setup

#### Alacritty Themes (Optional)

```bash
# Create themes directory if it doesn't exist
mkdir -p ~/.config/alacritty/themes

# Clone the official Alacritty themes
git clone https://github.com/alacritty/alacritty-theme.git ~/.config/alacritty/themes
```

#### Powerlevel10k Configuration

```bash
## todo. if i start the wizard, where will the conf go? into this repo or somewhere else?
```

Follow the interactive prompts to customize your terminal prompt.

#### Tmux Plugin Installation

```bash
# Inside tmux, press: prefix + I (that's capital i)
```

This will install all tmux plugins defined in the configuration.

#### Neovim Setup

```bash
# Launch Neovim
nvim
```

On first launch, lazy.nvim will automatically:
- Bootstrap itself
- Install all plugins
- Set up Mason for LSP/DAP/formatters

Wait for the installation to complete. You may need to restart Neovim after the initial setup.

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

## Verification Checklist

After installation, verify everything is working:

```bash
# Check if applications are installed
which alacritty   # Should show: /opt/homebrew/bin/alacritty (or /usr/local/bin/alacritty)
which nvim        # Should show: /opt/homebrew/bin/nvim
which tmux        # Should show: /opt/homebrew/bin/tmux

# Check if symlinks are created
ls -la ~/.zshrc              # Should point to ~/.dotfiles/zsh/.zshrc
ls -la ~/.config/alacritty/  # Should have alacritty.toml
ls -la ~/.config/nvim/       # Should point to ~/.dotfiles/nvim
ls -la ~/.tmux.conf          # Should point to ~/.dotfiles/tmux/tmux.conf

# Check if fonts are installed
fc-list | grep "Hack Nerd Font"  # Should show the font

# Check Neovim
nvim --version  # Should show v0.9.0 or higher

# Check Node.js and npm
node --version
npm --version
```

## Adding New Configs

1. Create a new directory: `mkdir ~/.dotfiles/tool-name`
2. Add your config file(s)
3. Update `install.sh` to create the symlink
4. Update this README with the new tool

## Migrating from Existing Setup

If you already have configs, the install script will:
1. Detect existing files
2. Back them up with a timestamp (format: `filename.backup.YYYYMMDD_HHMMSS`)
3. Create new symlinks

Your old configs are never deleted, just renamed.

## Uninstalling

To remove these dotfiles and restore your system:

```bash
# Remove symlinks
rm ~/.zshrc
rm -rf ~/.config/alacritty
rm -rf ~/.config/nvim
rm ~/.tmux.conf

# Restore from backups if desired
mv ~/.zshrc.backup.YYYYMMDD_HHMMSS ~/.zshrc
# (repeat for other files)

# Optionally remove the dotfiles directory
rm -rf ~/.dotfiles
```
