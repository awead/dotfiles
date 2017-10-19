# dotfiles
OS X Setup

## Pre-Requisites

* Dev tools installed

## Things I Can't Do Automatically

### Disable Unneeded Services

On select systems, I don't want iPhoto-related services running.

1. Boot into recovery mode (⌘-R)
2. Open Terminal
3. run `csrutil disable`
4. Reboot
5. `sudo scripts/disable-services.sh`
6. Reboot into recovery mode and `csrutil enable`
