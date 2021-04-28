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

# .bundle
mkdir -p $HOME/.bundle
rm -f $HOME/.bundle/config
ln -s $HOME/.dotfiles/home/bundle/config $HOME/.bundle/config

# .ssh
if [ -z $SAFE ]; then
  echo "No safe found. Skipping..."
else
  mkdir -p $HOME/.ssh
  rm -f $HOME/.ssh/config
  ln -s $HOME/.dotfiles/home/ssh/config $HOME/.ssh/config
  cp $SAFE/Keys/* $HOME/.ssh
  cd $HOME
  tar -xf $SAFE/gpg.tar
fi

# .bash_private
ln -Fs $HOME/Dropbox/Projects/private-dotfiles/bash_private $HOME/.bash_private

# .vim
rm -Rf $HOME/.vim
mkdir -p $HOME/.vim/pack/minpac/opt/minpac
git clone https://github.com/k-takata/minpac.git $HOME/.vim/pack/minpac/opt/minpac
vim +PackUpdate +qall

# fzf config
/usr/local/opt/fzf/install --all 

# git
rm -Rf $HOME/.git-templates
ln -Fs $HOME/.dotfiles/home/git-templates $HOME/.git-templates

# cheat
source $HOME/cheat/install.sh

# Create project directories
mkdir -p $HOME/Projects/Github/aic-collections
mkdir -p $HOME/Projects/Github/awead
mkdir -p $HOME/Projects/Github/samvera
mkdir -p $HOME/Projects/Github/samvera-labs
mkdir -p $HOME/Projects/Github/psu-libraries
