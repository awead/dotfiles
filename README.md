# dotfiles
OS X Setup

## Pre-Requisites

* Dev tools installed

## Things I Can't Do Automatically

### System Preferences

* turn off fast user switching
* setup scrolling
* tap-clicks
* three-fingered drag

### Terminal

* 16 pt. Inconsolata font

### GPG Import/Export

    gpg --export-secret-keys > my-secret-keyring.gpg
    gpg --export-options export-local-sigs --export > my-public-keyring.gpg
    gpg --import my-secret-keyring.gpg
    gpg --import-options import-local-sigs my-public-keyring.gpg
