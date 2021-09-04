#!/bin/bash
# --------------------------------------------------------------------------
# Setup script for Postgres
# --------------------------------------------------------------------------

if test ! $(which postgres); then
  echo "PostgreSQL isn't installed"
  exit 1;
fi

brew services stop postgres
rm -Rf $HOMEBREW_PREFIX/var/postgres
brew uninstall --force postgres
brew install postgres
mkdir -p ~/Library/LaunchAgents
ln -sfv $HOMEBREW_PREFIX/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
brew services start postgres
createdb `whoami`
