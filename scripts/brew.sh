#!/bin/bash
# --------------------------------------------------------------------------
# Install/Update Homebrew
# --------------------------------------------------------------------------

HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_NO_INSECURE_REDIRECT
HOMEBREW_CASK_OPTS=--require-sha
export HOMEBREW_CASK_OPTS

if test ! $(which brew)
then
  echo "Homebrew is not installed. You should do this next part manually"
  exit 1;
  xcode-select --install
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  sudo su -
  cd $HOMEBREW_PREFIX
  chown -R `whoami`:staff *
else
  echo "Checking Homebrew"
  brew doctor
  if [ $? -ne 0 ]; then
    echo "There's a problem with brew. Re-run 'brew doctor' and fix"
    exit 1;
  fi
  brew update
  brew tap homebrew/bundle
  brew bundle
fi
