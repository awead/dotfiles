#!/bin/bash

echo "Downloading and installing Moneydance"
cd $TMPDIR
rm -Rf Moneydance*
wget --show-progress https://infinitekind.com/stabledl/current/Moneydance.zip
unzip -o Moneydance.zip -d ~/Applications -x '__MACOSX/*'
