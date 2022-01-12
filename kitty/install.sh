#!/bin/bash

# Updates/Installs kitty config

rm -Rf $HOME/.config/kitty
mkdir -p $HOME/.config
ln -Fs $HOME/.dotfiles/kitty $HOME/.config/kitty
