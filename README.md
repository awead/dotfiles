# dotfiles

OS X Setup

## Things I Can't Do Automatically

### System Preferences

* FileVault
* Firewall: stealth, no autos
* Privacy settings: analytics, advertising
* turn off fast user switching
* setup scrolling
* tap-clicks
* three-fingered drag
* full disk access to: Terminal, bash (see https://github.com/mathiasbynens/dotfiles/issues/849)
* update login picture
* name computer

### Installs

* XCode
* Dropbox

### Terminal

* 16 pt. Inconsolata font

### Disabling Unneeded Services

    mkdir ~/Library/Disabled/LaunchAgents
    mkdir ~/Library/Disabled/LaunchDaemons

Move selected plist files out of /Library/LaunchAgents and Daemons.
