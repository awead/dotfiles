#!/bin/bash
# --------------------------------------------------------------------------
# Installs all rubies with appropriate default gems.
# --------------------------------------------------------------------------

RUBIES="2.3.7 2.4.6 2.6.3 2.6.5"

if test ! $(which asdf); then
  echo "asdf isn't installed"
  exit 1;
fi

# Install each Ruby version
for version in ${RUBIES[@]}
do
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

# Update gem credentials
source scripts/rubygems.sh
