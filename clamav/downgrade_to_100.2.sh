#!/bin/bash

# See https://github.com/eagleas/clamav/issues/11

brew unlink clamav
brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/ee7114856bafbfac500a4d039d7d5bf26511158a/Formula/clamav.rb
