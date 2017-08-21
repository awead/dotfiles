#!/bin/bash
# --------------------------------------------------------------------------
# Post-Update
# Run this after any OSX update to make sure everything else is current
# --------------------------------------------------------------------------

# brew complains about this file. It'll get added back when home.sh runs
rm ~/.curlrc

source $HOME/.dotfiles/scripts/brew.sh

# Update dependencies, reset mariadb and postgres databases, update zsh
source $HOME/.dotfiles/mariadb/setup.sh
source $HOME/.dotfiles/postgres/setup.sh
source $HOME/.dotfiles/scripts/dependencies.sh
source $HOME/.dotfiles/scripts/zsh.sh

source $HOME/.dotfiles/scripts/home.sh
source $HOME/.dotfiles/scripts/osx.sh
