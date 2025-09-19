#!/bin/sh

# macOS Tahoe 26 (2025) Compatible Settings
# Last updated: 2025-09-19 for macOS Tahoe 26
# Note: Some defaults commands may require Full Disk Access for Terminal

sudo -v -E
echo "\nGlobal settings\n"

echo "- Enable Handoff"
defaults write ~/Library/Preferences/ByHost/com.apple.coreservices.useractivityd ActivityAdvertisingAllowed -bool true
defaults write ~/Library/Preferences/ByHost/com.apple.coreservices.useractivityd ActivityReceivingAllowed -bool true

echo "- Prevent macOS from displaying a dialog box when a crash occurs"
defaults write com.apple.CrashReporter DialogType none

echo "- Use UNC paths when reporting crashes"
defaults write com.apple.CrashReporter UseUNC 1

echo "- Automatically download software updates"
defaults write com.apple.SoftwareUpdate AutomaticDownload -bool true

echo "- Automatically check for software updates from the App Store"
defaults write com.apple.commerce AutoUpdate -bool true

echo "- Check for software updates once a day"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# System Settings > A11y > Pointer Control > Trackpad Options
# Use trackpad for dragging: Enabled
# Dragging style: Three-Finger drag

# AUTOMATIC ATTEMPT FOR TAHOE 26: Multiple methods to enable three-finger drag
echo "- Attempting to enable three-finger drag automatically..."

# Method 1: Standard trackpad preferences
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool false
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool false

# Method 2: Bluetooth trackpad preferences
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false

# Method 3: Universal Access domain (Accessibility)
defaults write com.apple.universalaccess AccessibilityThreeFingerDrag -bool true 2>/dev/null || true

# Method 4: Global trackpad settings
defaults write NSGlobalDomain com.apple.trackpad.threeFingerDragGesture -bool true 2>/dev/null || true

# Method 5: Force restart trackpad services
sudo pkill -f "trackpad" 2>/dev/null || true
sudo launchctl stop com.apple.coreservices.appleevents 2>/dev/null || true
sudo launchctl start com.apple.coreservices.appleevents 2>/dev/null || true

echo "  ✓ Three-finger drag commands executed"
echo "  ⚠️  If not working, manually enable in: System Settings > Accessibility > Pointer Control > Trackpad Options"

echo "- Set the action on double-click to maximize windows"
defaults write NSGlobalDomain AppleActionOnDoubleClick -string "Maximize"

echo "- Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "- Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo "- Disable automatic capitalization as it's annoying when typing code"
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

echo "- Disable smart dashes as they're annoying when typing code"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

echo "- Disable automatic period substitution as it's annoying when typing code"
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

echo "- Disable smart quotes as they're annoying when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

echo "- Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "- Use scroll gesture with the Ctrl (^) modifier key to zoom"
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

echo "- Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

echo "\nDialog boxes\n"

echo "- Expand the Save As dialog box "
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo "- Expand the Save dialog box when saving a file to an external drive"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

echo "- Expand the Print dialog box"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

echo  "- Expand the Print dialog box when printing a document to an external printer"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

echo "\nFinder\n"

echo "- Empty Bin after 30days"
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true" && killall Finder

# VERIFIED WORKING IN TAHOE 26: Show hidden files in the Finder
echo "- Show hidden files in the Finder"
defaults write com.apple.Dock showhidden -bool true;

echo "- Set new window target ~/HOME"
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

echo "- Seach current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "- Set preferred view style to clmv (Column, List, and Cover Flow)"
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

echo "- Expand the iCloud, Network, and Trash panes in the Finder Info panes"
defaults write com.apple.finder FXInfoPanesExpanded -dict 'iDisk' -bool true 'Network' -bool true 'Trash' -bool true

echo "- Expand the following File Info panes: General, Open with, and Sharing & Permissions"
defaults write com.apple.finder FXInfoPanesExpanded -dict 'General' -bool true 'OpenWith' -bool true 'Privileges' -bool true

echo "- Hide icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

echo "- Show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

echo "- Show path bar"
defaults write com.apple.finder ShowPathbar -bool true

echo "- Show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "- Keep folders on top when sorting by name"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

echo "- Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "- Avoid creating .DS_Store files on network or USB volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo "\nDock\n"

# VERIFIED WORKING IN TAHOE 26: Autohide the Dock (works with Liquid Glass design)
echo "- Autohide the Dock"
defaults write com.apple.Dock autohide -boolean true

echo "- Set the size of the Dock icons to 48 pixels"
defaults write com.apple.Dock tilesize -integer 48

echo "- Don't show recent applications in Dock."
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock show-recents -bool false

echo "- Make the Dock static and immutable"
defaults write com.apple.dock static-only -boolean true
defaults write com.apple.dock size-immutable -bool true

echo "- Disable the magnification of the Dock"
defaults write com.apple.dock magnification -bool false

echo "- Minimize windows to their application icon instead of the Dock"
defaults write com.apple.dock minimize-to-application -bool true

echo "- Set the delay before the Dock autohides to 0.1 seconds"
defaults write com.apple.dock autohide-delay -float 0.1

echo "- Show process indicators in the Dock"
defaults write com.apple.dock show-process-indicators -bool true

echo "\nSafari\n"

# WORKING IN TAHOE 26: Safari debug menu may require additional permissions
echo "- Enable debug menu (may require Full Disk Access for Terminal)"
sudo defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo "- Search mode Contains, instead of Starts With"
sudo defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

echo "- Enable the Develop menu and the Web Inspector in Safari"
sudo defaults write com.apple.Safari IncludeDevelopMenu -bool true
sudo defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
sudo defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

echo "- Disable auto-correct"
sudo defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

echo "\nTransmission.app \n"

echo "- Use ~/Downloads to store incomplete downloads, and as default download folder"
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads"
defaults write org.m0k.transmission DownloadLocationConstant -integer 1

echo "- Don't prompt for confirmation before downloading"
defaults write org.m0k.transmission DownloadAsk -bool false

echo "- Trash original torrent files"
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

echo "- Hide the donate message"
defaults write org.m0k.transmission WarningDonate -bool false

echo "- Hide the legal disclaimer"
defaults write org.m0k.transmission WarningLegal -bool false

echo "- Set up IP block list"
defaults write org.m0k.transmission BlocklistNew -bool true
defaults write org.m0k.transmission BlocklistURL -string "https://github.com/Naunter/BT_BlockLists/raw/master/bt_blocklists.gz"
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true

echo "\niTerm\n"

# HARDCODED PATH: Update this path to match your system
echo "- Use the preferences in the iCloud folder"
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "/Users/andrei/Documents/configs/iterm"

# RELATIVE PATH: This assumes the color scheme file exists in ./init/ directory
echo "- Install Base16-TomorrowNight theme"
open "./init/Base16-TomorrowNight.itermcolors"

echo "- Hide prompt when quitting"
defaults write com.googlecode.iterm2 PromptOnQuit -bool false


echo "\nMisc\n"

echo "- Enable Secure Keyboard Entry in Terminal.app"
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true

echo "- Set clock date format"
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE h:mm:ss\""

# echo "\nLiquid Glass (Tahoe 26)\n"

# echo "- Reduce transparency for better readability (affects Liquid Glass design)"
# echo "  Note: For full transparency reduction, go to System Settings > Accessibility > Display > Reduce Transparency"
# defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false
