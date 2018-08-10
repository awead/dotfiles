#!/bin/bash
# --------------------------------------------------------------------------
# Update and configure our dependencies
# --------------------------------------------------------------------------

# Ruby
source ruby/install.sh

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
