#!/bin/bash
#
# Install asdf
# https://github.com/asdf-vm/asdf

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.5.1
source $HOME/.asdf/asdf.sh
asdf plugin-add nodejs
asdf plugin-add ruby
asdf plugin-add java
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 8.11.2
asdf install nodejs 9.11.1
asdf install java oracle-8.181
