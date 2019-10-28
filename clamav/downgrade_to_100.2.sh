#!/bin/bash

# See https://github.com/eagleas/clamav/issues/11
# This is needed for Scholarsphere 3 and the clamav gem. You can ignore once we no longer need to use the gem.

brew unlink clamav
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/ee7114856bafbfac500a4d039d7d5bf26511158a/Formula/clamav.rb
gem install clamav -- --with-clamav-dir=/usr/local/Cellar/clamav/0.100.2 --with-opt-include=/usr/local/opt/openssl/include
