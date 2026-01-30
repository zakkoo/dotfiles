# ============================================================================
# POWERLEVEL10K INSTANT PROMPT
# ============================================================================
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ============================================================================
# PATH CONFIGURATION
# ============================================================================
# Add Homebrew to PATH
export PATH="/opt/homebrew/bin:$PATH"

# ============================================================================
# NVM (NODE VERSION MANAGER)
# ============================================================================
export NVM_DIR="$HOME/.nvm"
# Load nvm
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
# Load nvm bash completion
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# ============================================================================
# ZSH PLUGINS
# ============================================================================
# Powerlevel10k theme
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
# Autosuggestions - suggest commands as you type
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Syntax highlighting - highlight commands as you type
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ============================================================================
# ALIASES
# ============================================================================
# Use eza instead of ls for better file listing with icons
alias ls="eza --icons=always --all"
# Use zoxide instead of cd for smart directory jumping
alias cd="z"

# ============================================================================
# ZOXIDE (SMART CD)
# ============================================================================
# Initialize zoxide - a smarter cd command that learns your habits
eval "$(zoxide init zsh)"

# ============================================================================
# POWERLEVEL10K CONFIGURATION
# ============================================================================
# Load Powerlevel10k config (run `p10k configure` to customize)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ============================================================================
# HISTORY CONFIGURATION
# ============================================================================
HISTFILE=$HOME/.zhistory       # Where to save history
SAVEHIST=1000                  # Number of commands to save
HISTSIZE=999                   # Number of commands to load in memory
setopt share_history           # Share history between all sessions
setopt hist_expire_dups_first  # Expire duplicate entries first
setopt hist_ignore_dups        # Don't record duplicate consecutive commands
setopt hist_verify             # Show command with history expansion before running

# History search with arrow keys
bindkey "^[[A" history-search-backward  # Up arrow
bindkey "^[[B" history-search-forward   # Down arrow
