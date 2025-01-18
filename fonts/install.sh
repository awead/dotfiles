#!/bin/bash

# Install fonts

rm -rf /private/tmp/fonts
mkdir -p /private/tmp/fonts
cd /private/tmp/fonts
wget https://github.com/mishamyrt/Lilex/archive/refs/heads/master.zip 
unzip master.zip
cp Lilex-master/fonts/ttf/*.* ~/Library/Fonts
