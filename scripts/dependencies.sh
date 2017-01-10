#!/bin/bash
# --------------------------------------------------------------------------
# Update and configure our dependencies
# --------------------------------------------------------------------------

# Settings
RUBIES=(2.3.1 2.3.3)

# Ruby
if test ! $(which ruby-install); then
  echo "ruby-install isn't installed"
  exit 1;
fi

for version in ${RUBIES[@]}
do
  ruby-install --no-reinstall ruby $version
  chflags hidden ~/src

  for path in `find $HOME/.rubies -name gems`
  do
    rm -Rf $path/*
  done

  source /usr/local/share/chruby/chruby.sh
  chruby $version
  gem update --system
  gem install bundler
done

# ClamAV
cp /usr/local/etc/clamav/freshclam.conf.sample /usr/local/etc/clamav/freshclam.conf
cp /usr/local/etc/clamav/clamd.conf.sample /usr/local/etc/clamav/clamd.conf
perl -pi -e 's/^/#/ if /^Example/' /usr/local/etc/clamav/freshclam.conf
freshclam

# Redis
find /usr/local -name "*redis.plist" -exec cp '{}' $HOME/Library/LaunchAgents \;
