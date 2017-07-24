#!/bin/sh

echo "The defaults are being put in place."

echo "Admin, anyone?"
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "\nGlobal."

echo "- Expand save panel."
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

echo "- Expand print panel."
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

echo "- Check for software updates daily, not just once per week."
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo "- Use scroll gesture with the Ctrl (^) modifier key to zoom."
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

echo "\nMenu bar."

echo "- Customize the clock look."
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM  HH:mm:ss"

echo "- Change the battery to show the percentage."
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

echo "\nKeyboard."

echo "- Set Keyboard > Key Repeat to be the fastest possible from System Preferences."
defaults write NSGlobalDomain KeyRepeat -integer 2

echo "- Set Keyboard > Delay Until Repeat to be the fastest possible from System Preferences."
defaults write NSGlobalDomain InitialKeyRepeat -integer 15

echo "\nTrackpad."

echo "- Enable three finger drag."
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -integer 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -integer 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -integer 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -integer 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -integer 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -integer 0
defaults write NSGlobalDomain com.apple.trackpad.threeFingerSwipeGesture -integer 1

echo "- Enable four finger Exposé."
defaults write com.apple.dock showAppExposeGestureEnabled -integer 1

echo "\nDock."

echo "- Turn on dock autohiding."
defaults write com.apple.Dock autohide -boolean true

echo "- Resize dock tiles."
defaults write com.apple.Dock tilesize -integer 48

echo "- Wipe all (default) app icons from the Dock."
defaults write com.apple.dock persistent-apps -array ""

echo "\nFinder."

echo "- Set default path to HOME directory."
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

echo "- When performing a search, search the current folder by default."
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "- Avoid creating .DS_Store files on network volumes."
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "- Enable snap-to-grid for icons on the desktop and in other icon views."
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

echo "- Use list view in all Finder windows by default."
# Four-letter codes for all views: `icnv`, `Nlsv`, `clmv`, `Flwv`.
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

echo "- Expand the following File Info panes: General, Open with, and Sharing & Permissions."
defaults write com.apple.finder FXInfoPanesExpanded -dict \
  General -bool true \
  OpenWith -bool true \
  Privileges -bool true

echo "- Hide icons for hard drives, servers, and removable media on the desktop."
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

echo "\nSafari."

echo "- Set home page to about:blank."
defaults write com.apple.Safari HomePage -string "about:blank"

echo "- Always show tab bar."
defaults write com.apple.Safari AlwaysShowTabBar -boolean true

echo "- Enable Safari’s debug menu."
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo "- Make Safari’s search banners default to Contains instead of Starts With."
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

echo "- Enable the Develop menu and the Web Inspector in Safari."
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

echo "\nSpotlight."

echo "- Disable Spotlight indexing for any volume that gets mounted and has not yet been indexed before."
# Use `sudo mdutil -i off "/Volumes/foo"` to stop indexing any volume.
sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"

echo "\nTransmission.app."

echo "- Use ~/Downloads to store incomplete downloads, and as default download folder."
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads"
defaults write org.m0k.transmission DownloadLocationConstant -integer 1

echo "- Don’t prompt for confirmation before downloading."
defaults write org.m0k.transmission DownloadAsk -bool false

echo "- Trash original torrent files."
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

echo "- Hide the donate message."
defaults write org.m0k.transmission WarningDonate -bool false

echo "- Hide the legal disclaimer."
defaults write org.m0k.transmission WarningLegal -bool false

echo "\nDone. Moving on."
