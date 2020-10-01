#!/bin/bash
# --------------------------------------------------------------------------
# Update and configure our dependencies
# --------------------------------------------------------------------------

# Ruby
# source asdf/install.sh
# source ruby/install-all.sh
# source scripts/rubygems.sh

# Redis
find /usr/local -name "*redis.plist" -exec cp '{}' $HOME/Library/LaunchAgents \;

# puma-dev
sudo puma-dev -setup
puma-dev -install

# kubectl
kubectl krew install oidc-login

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
