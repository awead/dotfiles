#!/bin/bash
# --------------------------------------------------------------------------
# Install secure items
# --------------------------------------------------------------------------

SAFE=$1

if [ -z $SAFE ]; then
  echo "Where's the safe?"
  exit 1;
fi

# SSH keys
mkdir $HOME/.ssh
cp $SAFE/Keys/* $HOME/.ssh
