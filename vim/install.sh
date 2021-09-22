#!/bin/bash

rm -Rf $HOME/.vim/autoload
rm -Rf $HOME/.vim/bundle

mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle
curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd $HOME/.vim/bundle

git clone https://github.com/bcicen/vim-jfmt.git
git clone https://github.com/benmills/vimux.git
git clone https://github.com/christoomey/vim-tmux-navigator.git
git clone https://github.com/junegunn/fzf.git
git clone https://github.com/junegunn/fzf.vim.git
git clone https://github.com/machakann/vim-highlightedyank.git
git clone https://github.com/mtth/scratch.vim.git
git clone https://github.com/pangloss/vim-javascript.git
git clone https://github.com/preservim/nerdtree.git
git clone https://github.com/tpope/vim-bundler.git
git clone https://github.com/tpope/vim-endwise.git
git clone https://github.com/tpope/vim-eunuch.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/tpope/vim-projectionist.git
git clone https://github.com/tpope/vim-rails.git
git clone https://github.com/tpope/vim-rake.git
git clone https://github.com/tpope/vim-repeat.git
git clone https://github.com/tpope/vim-sensible.git
git clone https://github.com/tpope/vim-sensible.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/tpope/vim-unimpaired.git
git clone https://github.com/vim-ruby/vim-ruby.git
git clone https://github.com/vim-scripts/tComment.git
git clone https://github.com/vim-test/vim-test.git
