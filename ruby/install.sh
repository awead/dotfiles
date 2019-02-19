#!/bin/bash
# --------------------------------------------------------------------------
# Install rubies, gem, and bundler
# --------------------------------------------------------------------------

RUBIES="2.3.3 2.3.7 2.4.1"

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

  # Remove default gem specifications and install latest
  for path in `find ~/.asdf/installs/ruby/${version} -name default`
  do
    rm -Rf $path/*
  done
  gem update --system
  gem install bundler
done

# Update gem credentials
source scripts/rubygems.sh
