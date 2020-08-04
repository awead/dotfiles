#!/bin/bash

# Installs/re-installs cheat

cheat --init > $HOME/.dotfiles/cheat/conf.yml

rm -Rf $HOME/.config/cheat
ln -Fs $HOME/.dotfiles/cheat $HOME/.config/cheat
rm -Rf $HOME/.config/cheat/cheatsheets/community
git clone https://github.com/cheat/cheatsheets $HOME/.config/cheat/cheatsheets/community
