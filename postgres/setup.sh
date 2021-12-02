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
brew uninstall --force postgresql@13
brew install postgresql@13
mkdir -p ~/Library/LaunchAgents
ln -sfv $HOMEBREW_PREFIX/opt/postgresql@13/*.plist ~/Library/LaunchAgents
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
brew services start postgres
createdb `whoami`
