#!/bin/bash
# --------------------------------------------------------------------------
# Update and configure our dependencies
# --------------------------------------------------------------------------

# Settings
RUBIES=(2.3.3 2.3.7 2.4.1)

# Ruby
if test ! $(which ruby-install); then
  echo "ruby-install isn't installed"
  exit 1;
fi

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

# ClamAV
cp /usr/local/etc/clamav/freshclam.conf.sample /usr/local/etc/clamav/freshclam.conf
cp /usr/local/etc/clamav/clamd.conf.sample /usr/local/etc/clamav/clamd.conf
perl -pi -e 's/^/#/ if /^Example/' /usr/local/etc/clamav/freshclam.conf
freshclam

# Redis
find /usr/local -name "*redis.plist" -exec cp '{}' $HOME/Library/LaunchAgents \;

# Sublime settings
rm -Rf "$HOME/Library/Application Support/Sublime Text 3/Packages/User"
mkdir -p "$HOME/Library/Application Support/Sublime Text 3/Packages"
ln -s $HOME/.dotfiles/sublime "$HOME/Library/Application Support/Sublime Text 3/Packages/User"

# Third-party packages
if [ -z $SAFE ]; then
  echo "No safe found. Skipping..."
else
  # Ask for the administrator password upfront
  sudo -v

  # Keep-alive: update existing `sudo` time stamp until this has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
  installer -target / -pkg "$SAFE/Library/Packages/PSU AnyConnect Installer.pkg"
fi
