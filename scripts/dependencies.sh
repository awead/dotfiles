#!/bin/bash
# --------------------------------------------------------------------------
# Update and configure our dependencies
# --------------------------------------------------------------------------

# asdf
source asdf/install.sh

# Ruby
# source ruby/install-all.sh
# source scripts/rubygems.sh

# puma-dev
sudo puma-dev -setup
puma-dev -install

# kubectl
kubectl krew install oidc-login

# Vim
source vim/install.sh
