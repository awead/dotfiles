#!/bin/bash
# --------------------------------------------------------------------------
# Install/Update Homebrew
# --------------------------------------------------------------------------

if test ! $(which brew)
then
  echo "Homebrew is not installed. You should do this next part manually"
  exit 1;
  su $ADMINISTRATOR
  xcodebuild -license
  xcode-select --install
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  sudo su -
  chown -R awead:staff /usr/local
else
  echo "Checking Homebrew"
  if [ `brew doctor 2>&1 | wc -l` -gt 14 ]; then
    echo "There's a problem with brew. Re-run 'brew doctor' and fix"
    exit 1;
  fi
  brew update
  brew tap homebrew/bundle
  brew bundle
fi
