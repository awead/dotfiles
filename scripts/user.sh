#!/bin/bash

dscl . delete /Users/`whoami` jpegphoto
dscl . delete /Users/`whoami` Picture
dscl . append /Users/`whoami` Picture $HOME/Dropbox/Library/headshot.jpeg
dscl . append /Users/`whoami` RealName "Adam Wead"
