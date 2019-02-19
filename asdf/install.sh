#!/bin/bash
#
# Install asdf
# https://github.com/asdf-vm/asdf

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.3
source $HOME/.asdf/asdf.sh
asdf plugin-add nodejs
asdf plugin-add ruby
asdf plugin-add java
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 11.8.0
