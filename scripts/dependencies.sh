#!/bin/bash
# --------------------------------------------------------------------------
# Update and configure our dependencies
# --------------------------------------------------------------------------

# Ruby
if test ! $(which chruby); then
  echo "chruby isn't installed"
  exit 1;
fi
ruby-install ruby 2.3.1
ruby-install ruby 2.3.3
chflags nohidden ~/src

for path in `find $HOME/.rubies -name gems`
do
  rm -Rf $path/*
done

source /usr/local/share/chruby/chruby.sh
chruby 2.3.1
gem update --system
gem install bundler

chruby 2.3.3
gem update --system
gem install bundler

# ClamAV
cp /usr/local/etc/clamav/freshclam.conf.sample /usr/local/etc/clamav/freshclam.conf
cp /usr/local/etc/clamav/clamd.conf.sample /usr/local/etc/clamav/clamd.conf
perl -pi -e 's/^/#/ if /^Example/' /usr/local/etc/clamav/freshclam.conf
freshclam
