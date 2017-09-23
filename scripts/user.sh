#!/bin/bash

dscl . delete /Users/`whoami` jpegphoto
dscl . delete /Users/`whoami` Picture
dscl . append /Users/`whoami` Picture /Users/awead/Dropbox/Library/headshot.jpeg
