#!/bin/bash
# --------------------------------------------------------------------------
# Update and configure our dependencies
# --------------------------------------------------------------------------

# Ruby
# source asdf/install.sh
# source ruby/install-all.sh
# source scripts/rubygems.sh

# Redis
find $HOMEBREW_PREFIX -name "*redis.plist" -exec cp '{}' $HOME/Library/LaunchAgents \;

# puma-dev
sudo puma-dev -setup
puma-dev -install

# kubectl
kubectl krew install oidc-login

