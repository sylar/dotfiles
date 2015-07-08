echo " Installing native apps using \`brew cask\`."

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# With the new Spotlight, there is no point into installing Alfred
# brew cask install alfred
brew cask install atom
brew cask install flash
brew cask install flux
brew cask install iterm2
brew cask install knock
brew cask install slack
brew cask install spectacle
brew cask install telegram
brew cask install transmission
brew cask install xquartz
brew cask install skype
brew cask install appcleaner
brew cask install keyboard-cleaner
brew cask install ccleaner
brew cask install teamviewer
brew cask install coconutbattery
brew cask install messenger
brew cask install tunnelbear
brew cask install vlc
brew cask install google-chrome-canary
# brew cask install battle-net
# brew cask install mailbox
# brew cask install spotify
# brew cask install openemu-experimental

echo "Running brew cask caveats."

# Link brew cask installed apps into Alfred.
# brew cask alfred

# Safaritabswitching isn't updated, boo.
# mkdir -p ~/.tmp/
# wget https://github.com/rs/SafariTabSwitching/releases/download/1.2.7/Safari.Tab.Switching-1.2.7.zip -P ~/.tmp/
# unzip ~/.tmp/Safari.Tab.Switching-1.2.7.zip
# open ~/.tmp/Safari\ Tab\ Switching-1.2.7.pkg

echo "Successfully installed all brew cask apps.\n"
