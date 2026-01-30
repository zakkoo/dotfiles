# dotfiles

Personal development environment configuration for macOS.

## What's Included

- **Zsh** - Shell configuration with Powerlevel10k theme
- **Alacritty** - GPU-accelerated terminal emulator
- **Tmux** - Terminal multiplexer configuration
- **Neovim** - Text editor configuration

## Quick Start

### Fresh Installation

```bash
# Clone the repository
git clone https://github.com/zakkoo/dotfiles.git ~/.dotfiles

# Run the install script
cd ~/.dotfiles
chmod +x install.sh
./install.sh
```

The install script creates symlinks from your home directory to the dotfiles repo. Existing files are automatically backed up with timestamps.

### Manual Installation

If you prefer to link configs individually:

```bash
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -sf ~/.dotfiles/nvim ~/.config/nvim
ln -sf ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

## Dependencies

### Required

```bash
# Homebrew (if not installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Core tools
brew install alacritty tmux neovim

# Fonts (required for terminal icons)
brew install font-hack-nerd-font

# Zsh theme
brew install powerlevel10k
```

### Optional

```bash
# Additional Nerd Fonts
brew install font-fira-code-nerd-font
brew install font-jetbrains-mono-nerd-font
brew install font-meslo-lg-nerd-font

# Alacritty themes
cd ~/.config/alacritty/
git clone https://github.com/alacritty/alacritty-theme.git themes
```

## Updating

Since configs are symlinked, just pull the latest changes:

```bash
cd ~/.dotfiles
git pull
```

Changes take effect immediately (Alacritty) or after restart (Zsh).

## Adding New Configs

1. Create a new directory: `mkdir ~/.dotfiles/tool-name`
2. Add your config file(s)
3. Update `install.sh` to create the symlink
4. Update this README

## Migrating from Existing Setup

If you already have configs, the install script will:
1. Detect existing files
2. Back them up with a timestamp
3. Create new symlinks

Your old configs will be saved as `filename.backup.YYYYMMDD_HHMMSS`

## Troubleshooting

**Symlinks not working?**
```bash
# Check if symlink exists
ls -la ~/.zshrc

# Should show: ~/.zshrc -> /Users/your-username/.dotfiles/zsh/.zshrc
```

**Config changes not applying?**
- Alacritty: Changes apply immediately (live reload enabled)
- Zsh: Run `source ~/.zshrc` or restart terminal
- Tmux: Run `tmux source-file ~/.tmux.conf`
- Neovim: Restart or run `:source $MYVIMRC`

## Previous Repositories

This replaces the following separate config repos:
- `mynvim` → Now in `~/.dotfiles/nvim/`
- `myalacritty` → Now in `~/.dotfiles/alacritty/`
- `mytmux` → Now in `~/.dotfiles/tmux/`

## License

Personal configuration - feel free to use and modify as needed.
