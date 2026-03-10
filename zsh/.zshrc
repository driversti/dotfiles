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

alias ls='ls --color=auto'
alias ll='ls -alF'
alias lh='ls -alhF'

alias dps='docker ps'
alias dpsa='docker ps -a'
alias dcu='docker compose up'
alias dcud='docker compose up -d'
alias dcd='docker compose down'
alias dcps='docker compose ps'
alias dcp='docker compose pull'
