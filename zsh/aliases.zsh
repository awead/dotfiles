# Aliases
alias ls='ls -Gh'
alias date-iso-8601='date -u +"%Y-%m-%dT%H:%M:%SZ"'
alias eject-data='hdiutil eject /Volumes/Data'
alias dotfiles='cd ~/.dotfiles'
alias tmux="TERM=screen-256color-bce tmux"
alias tls="tmux ls"
alias ta="tmux attach -t"
alias tn="TERM=screen-256color-bce tmux new -s"
alias k="kubectl"
alias dc="docker compose" # NB: this overrides /usr/bin/dc which is a calculator program
alias ls-projects="find ~/Projects/Github -type d -depth 2"

# Azure
alias az-suffix="uuidgen | tr '[:upper:]' '[:lower:]' | awk -F\- '{ print $5 }'"

# Git
# Note: Most of these are to override the zsh git plugin
# See: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
alias g='git status'
alias gb='git recent'
