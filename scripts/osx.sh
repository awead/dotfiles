#!/bin/bash
# --------------------------------------------------------------------------
# Setup script for OS X settings, preferences and applications
# --------------------------------------------------------------------------

#
# System Preferences
#

# Set appearance to graphite
defaults write NSGlobalDomain AppleAquaColorVariant -float 6

# Set highlight color to yellow
defaults write NSGlobalDomain AppleHighlightColor -string "1.000000 0.937255 0.690196"

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Automatically hide the dock
defaults write com.apple.dock autohide -bool true

# Move dock to right side
defaults write com.apple.dock orientation -string "right"

# Don't group applications together in mission control
defaults write com.apple.dock expose-group-by-app -bool false

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerSwipeGesture -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable “natural” (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Annoying Bluetooth audio problems
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Max (editable)" 80
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" 80
defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool (editable)" 80
defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool Min (editable)" 80
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool" 80
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Max" 80
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Min" 80

# Clock settings
defaults write com.apple.menuextra.clock DateFormat "EEE H:mm"
defaults write com.apple.menuextra.clock FlashDateSeparators 0
defaults write com.apple.menuextra.clock IsAnalog 0

# Disable auto capitalize
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Enable accessibility zoom with control key
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess closeViewScrollWheelModifiersInt -int 262144

# Disable screen saver
defaults -currentHost write com.apple.screensaver idleTime -int 0

# Use custom dictionary
rm -f "$HOME/Library/Spelling/LocalDictionary"
ln -s $HOME/.dotfiles/spelling/LocalDictionary "$HOME/Library/Spelling/LocalDictionary"

#
# Finder
#

# Show the Library folder
chflags nohidden ~/Library

# Disable the warning when changing file extensions
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Allow text-selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Don't show files on the Desktop
defaults write com.apple.finder CreateDesktop false

#
# Dock
#

# Clear it out
defaults delete com.apple.dock persistent-apps
defaults delete com.apple.dock persistent-others

# Add my own
while IFS= read -r line; do
	defaults write com.apple.dock persistent-apps -array-add "<dict>
		<key>tile-data</key>
		<dict>
			<key>file-data</key>
			<dict>
				<key>_CFURLString</key>
				<string>$line</string>
				<key>_CFURLStringType</key>
				<integer>0</integer>
			</dict>
		</dict>
	</dict>"
done < "$HOME/.dotfiles/scripts/conf/dock.conf"

#
# Terminal
#

cp $HOME/.dotfiles/terminal/*.ttf ~/Library/Fonts

# Delete all window groups - they'll be re-added below
defaults delete com.apple.Terminal "Window Groups"

osascript <<EOD
tell application "Terminal"
	set themeName to "Custom"
	do shell script "open '$HOME/.dotfiles/terminal/" & themeName & ".terminal'"
	(* Wait a little bit to ensure that the custom theme is added. *)
	delay 1
	(* Set the custom theme as the default terminal theme. *)
	set default settings to settings set themeName
	do shell script "open '$HOME/.dotfiles/terminal/Valkyrie.terminal'"
	do shell script "open '$HOME/.dotfiles/terminal/Scholarsphere.terminal'"
	do shell script "open '$HOME/.dotfiles/terminal/AIC.terminal'"
	do shell script "open '$HOME/.dotfiles/terminal/CHO.terminal'"
	do shell script "open '$HOME/.dotfiles/terminal/Fedora Testing (data).terminal'"
	do shell script "open '$HOME/.dotfiles/terminal/Fedora Testing (dev).terminal'"
end tell
EOD

#
# Mail
#

# No sounds
defaults write com.apple.mail PlayMailSounds -bool false
defaults write com.apple.mail NewMessagesSoundName -string ""

# Display preferences
defaults write com.apple.mail ShouldShowUnreadMessagesInBold -bool true
defaults write com.apple.mail EnableToCcInMessageList -bool true
defaults write com.apple.mail RichMessageList -bool false
defaults write com.apple.mail ConversationViewSortDescending -bool true

#
# iCal
#

defaults write com.apple.iCal "TimeZone support enabled" -bool true
defaults write com.apple.iCal "first day of week" -int 1

#
# Done. Restart things...
#

for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
	"Dock" "Finder" "Google Chrome" "Google Chrome Canary" "Mail" "Messages" \
	"Opera" "Photos" "Safari" "SizeUp" "Spectacle" "SystemUIServer" "Terminal" \
	"Transmission" "Tweetbot" "Twitter" "iCal"; do
	killall "${app}" &> /dev/null
done
