#!/bin/bash
# --------------------------------------------------------------------------
# Setup script for Postgres
# --------------------------------------------------------------------------

if test ! $(which postgres); then
  echo "PostgreSQL isn't installed"
  exit 1;
fi

brew services stop postgres
rm -Rf /usr/local/var/postgres
brew uninstall --force postgres
brew install postgres
brew services start postgres
createdb `whoami`
