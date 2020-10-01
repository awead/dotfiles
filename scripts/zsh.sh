#!/bin/bash
# --------------------------------------------------------------------------
# Setup zsh
# --------------------------------------------------------------------------

if test ! $(which zsh); then
  echo "zsh isn't installed"
  exit 1;
fi

# Install Oh My Zsh if it isn't already present
if [[ ! -d $HOME/.oh-my-zsh/ ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  source $ZSH/tools/upgrade.sh
fi
