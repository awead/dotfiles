#!/bin/bash
# --------------------------------------------------------------------------
# Installs git-quick-stats
#
# See https://github.com/arzzen/git-quick-stats
# --------------------------------------------------------------------------

cd $HOME/.dotfiles/bin
wget https://raw.githubusercontent.com/arzzen/git-quick-stats/master/git-quick-stats --output-document=git-quick-stats
chmod 0755 git-quick-stats
git config --global alias.quick-stats '! $HOME/.dotfiles/bin/git-quick-stats'
