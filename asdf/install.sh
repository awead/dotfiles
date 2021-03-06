#!/bin/bash
#
# Install asdf
# https://github.com/asdf-vm/asdf

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
source $HOME/.asdf/asdf.sh
asdf plugin-add nodejs
asdf plugin-add ruby
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 11.8.0
