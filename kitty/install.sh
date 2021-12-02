#!/bin/bash

# Updates/Installs kitty config

rm -Rf $HOME/.config/kitty
ln -Fs $HOME/.dotfiles/kitty $HOME/.config/kitty
