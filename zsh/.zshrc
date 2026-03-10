# Path
export PATH="$HOME/.local/bin:$PATH"

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="steeef"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  history-substring-search
)

source "$ZSH/oh-my-zsh.sh"

# Editor
export EDITOR='nano'

# Aliases
alias proj="cd ~/Projects"
