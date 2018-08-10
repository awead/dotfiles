#!/bin/bash
# --------------------------------------------------------------------------
# Install rubies, gem, and bundler
# --------------------------------------------------------------------------

RUBIES=`cat ~/.my-ruby-versions`

if test ! $(which ruby-install); then
  echo "ruby-install isn't installed"
  exit 1;
fi

# Install each Ruby version
for version in ${RUBIES[@]}
do
  ruby-install --no-reinstall ruby $version
  chflags hidden ~/src

  for path in `find $HOME/.rubies -name gems`
  do
    rm -Rf $path/*
  done

  source /usr/local/share/chruby/chruby.sh
  chruby $version
  gem update --system
  gem install bundler
done

# Update gem credentials
source scripts/rubygems.sh
