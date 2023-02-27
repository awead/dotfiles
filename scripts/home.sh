#!/bin/bash
# --------------------------------------------------------------------------
# Manage dot files and folders in $HOME
# --------------------------------------------------------------------------

# Symlink dotfiles

for filename in $HOME/.dotfiles/home/*; do
  if [ -f $filename ]; then
    ln -Fs $filename $HOME/.$(basename $filename)
  fi
done

# .bash
rm -Rf $HOME/.bash
ln -Fs $HOME/.dotfiles/home/bash $HOME/.bash

# .ssh
if [ -z $SAFE ]; then
  echo "No safe found. Skipping..."
else
  mkdir -p $HOME/.ssh
  rm -f $HOME/.ssh/config
  ln -s $HOME/.dotfiles/home/ssh/config $HOME/.ssh/config
  cp $SAFE/Keys/* $HOME/.ssh
fi

# fzf config
$HOMEBREW_PREFIX/opt/fzf/install --all 

# git
rm -Rf $HOME/.git-templates
ln -Fs $HOME/.dotfiles/home/git-templates $HOME/.git-templates

# cheat
source $HOME/.dotfiles/cheat/install.sh

# Create project directories
mkdir -p $HOME/Projects/Github/awead

# Kitty
source $HOME/.dotfiles/kitty/install.sh

# Vim + Neovim
source vim/install.sh
source nvim/install.sh
