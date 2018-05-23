#!/bin/bash
#
# Install asdf
# https://github.com/asdf-vm/asdf

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.3
source $HOME/.asdf/asdf.sh
asdf plugin-add nodejs
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 8.11.2
asdf install nodejs 9.11.1
