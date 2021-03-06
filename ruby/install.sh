#!/bin/bash
# --------------------------------------------------------------------------
# Install a single ruby version with a correct set of default gems
# --------------------------------------------------------------------------

if test ! $(which asdf); then
  echo "asdf isn't installed"
  exit 1;
fi

for version in ${1}
do
  echo "Installing Ruby $version"
  asdf install ruby $version
  source $HOME/.asdf/asdf.sh
  asdf local ruby $version

  # Remove default gem defaults and specifications
  for path in `find ~/.asdf/installs/ruby/${version} -name default`
  do
    rm -Rf $path/*
  done
  for path in `find ~/.asdf/installs/ruby/${version} -name specifications`
  do
    rm -Rf $path/*
  done

  gem uninstall -aIx
  gem update --system
  gem install -Nf bundler
done
