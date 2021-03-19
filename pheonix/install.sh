#!/bin/sh

brew install autoconf wxmac

asdf update
asdf plugin update --all
asdf plugin add erlang
asdf plugin add elixir

export KERL_CONFIGURE_OPTIONS="--without-javac --with-ssl=$(brew --prefix openssl)"
asdf install erlang latest
asdf install elixir latest
asdf global add erlang
asdf global add elixir

mix local.hex
mix archive.install hex phx_new 1.5.8

