# dotfiles

Personal development environment configuration for macOS.

## What's Included

- **Zsh** - Shell configuration with Powerlevel10k theme
- **Alacritty** - GPU-accelerated terminal emulator with transparent background
- **Tmux** - Terminal multiplexer with custom keybindings and session management
- **Neovim** - Modern text editor with LSP, DAP, and extensive plugin ecosystem

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

# Node.js (required for formatters like prettierd)
brew install node

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

### Step 3: Install Node.js Global Packages

```bash
# Prettierd (faster Prettier formatter)
npm install -g @fsouza/prettierd

# Optional: Install other formatters/linters as needed
npm install -g prettier eslint
```

### Step 4: Clone and Install Dotfiles

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
# Run the configuration wizard
p10k configure
```

Follow the interactive prompts to customize your terminal prompt.

#### Tmux Plugin Installation

```bash
# Start tmux
tmux

# Inside tmux, press: prefix + I (that's capital i)
# Default prefix in this config is Alt-b (Option-b on Mac)
# So press: Alt-b then Shift+i
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

### Manual Symlink Creation (Alternative)

If you prefer to link configs individually instead of using the install script:

```bash
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -sf ~/.dotfiles/nvim ~/.config/nvim
ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
```

## Dependency Reference

### Required Dependencies

| Tool | Purpose | Installation |
|------|---------|-------------|
| Homebrew | Package manager | See Prerequisites |
| Alacritty | Terminal emulator | `brew install --cask alacritty` |
| Neovim | Text editor | `brew install neovim` |
| Tmux | Terminal multiplexer | `brew install tmux` |
| Hack Nerd Font | Icons and glyphs | `brew install font-hack-nerd-font` |
| Powerlevel10k | Zsh theme | `brew install powerlevel10k` |
| ripgrep | Fast search tool | `brew install ripgrep` |
| fd | File finder | `brew install fd` |
| Node.js | JavaScript runtime | `brew install node` |
| Git | Version control | `brew install git` |

### Neovim Tools (Auto-installed by Mason)

These are automatically managed by Mason.nvim when you open Neovim:
- Language servers (LSPs) for various languages
- Debuggers (DAPs)
- Formatters: prettier, eslint_d, stylelint
- Additional tools as configured in Mason

### Optional Dependencies

| Tool | Purpose | Installation |
|------|---------|-------------|
| .NET SDK | C# development | `brew install dotnet` |
| csharpier | C# formatter | `dotnet tool install -g csharpier` |
| prettierd | Fast formatter | `npm install -g @fsouza/prettierd` |
| fourmolu | Haskell formatter | `cabal install fourmolu` |

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

## Configuration Details

### Alacritty
- **Font**: Hack Nerd Font (16pt)
- **Opacity**: 80% with background blur (macOS)
- **Theme**: Marine Dark (customizable)
- **Auto-start**: Automatically launches tmux session
- **Shell**: Zsh with Powerlevel10k

### Tmux
- **Prefix**: `Alt-b` (Option-b on Mac, not the default Ctrl-b)
- **Navigation**: Vim-style keys (h/j/k/l)
- **Mouse**: Enabled for pane selection and resizing
- **Plugins**: TPM, tmux-sensible, tmux-resurrect, tmux-continuum
- **Status Bar**: Custom with git branch indicator

### Neovim
- **Plugin Manager**: lazy.nvim
- **LSP**: Mason.nvim for language servers
- **Completion**: nvim-cmp with snippets
- **Debugging**: nvim-dap with UI
- **File Explorer**: nvim-tree
- **Fuzzy Finder**: Telescope
- **Theme**: Tokyo Night

## Troubleshooting

### Symlinks not working?

```bash
# Check if symlink exists
ls -la ~/.zshrc

# Should show: ~/.zshrc -> /Users/your-username/.dotfiles/zsh/.zshrc

# If broken, recreate manually
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
```

### Alacritty not launching?

```bash
# Check if installed correctly
brew list alacritty

# Reinstall if needed
brew reinstall --cask alacritty

# Check config syntax
alacritty --print-events
```

### Neovim plugins not loading?

```bash
# Launch Neovim and check lazy.nvim
nvim

# Inside Neovim, run:
:Lazy

# To reinstall all plugins:
:Lazy sync

# Check for errors:
:checkhealth
```

### Tmux plugins not installing?

```bash
# Check if TPM is installed
ls -la ~/.config/tmux/plugins/tpm

# If not, install manually
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# Start tmux and install plugins
tmux
# Then press: Alt-b + I (that's Alt-b followed by Shift+i)
```

### Fonts not displaying correctly?

```bash
# Verify Nerd Font is installed
brew list --cask | grep nerd-font

# Reinstall if needed
brew reinstall font-hack-nerd-font

# Make sure Alacritty is using the correct font
# Check alacritty.toml has: font.normal.family = "Hack Nerd Font"
```

### Telescope (Neovim fuzzy finder) not working?

```bash
# Make sure ripgrep and fd are installed
which rg   # Should show ripgrep path
which fd   # Should show fd path

# Install if missing
brew install ripgrep fd
```

### Formatters/Linters not working in Neovim?

```bash
# Check if Node.js is installed
node --version

# Install prettierd globally
npm install -g @fsouza/prettierd

# For C# support, install csharpier
dotnet tool install -g csharpier

# Inside Neovim, check Mason
:Mason
# Install any missing tools from the Mason UI
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

## Previous Repositories

This unified dotfiles repository replaces the following separate config repos:
- [`mynvim`](https://github.com/zakkoo/mynvim) → Now in `~/.dotfiles/nvim/`
- [`myalacritty`](https://github.com/zakkoo/myalacritty) → Now in `~/.dotfiles/alacritty/`
- [`mytmux`](https://github.com/zakkoo/mytmux) → Now in `~/.dotfiles/tmux/`

## Contributing

Found an issue or have a suggestion? Feel free to open an issue or pull request!

## License

Personal configuration - feel free to use and modify as needed.
