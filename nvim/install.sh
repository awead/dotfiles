#!/bin/bash

# Updates/Installs nvim

rm -Rf $HOME/.config/nvim
ln -Fs $HOME/.dotfiles/nvim $HOME/.config/nvim
