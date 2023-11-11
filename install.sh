#!/bin/sh

echo "\n macOS setup."

echo  "\nAdmin powers needed."
sudo -v

echo "\nWhat's the device name?"
read -p "Computer Name: " computerName

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Restore defaults
./macos.sh

echo "\n Homebrew"

if command -v brew >/dev/null 2>&1; then
  echo "Already installed. Updating..."
  brew update
  brew upgrade
else
  echo "Installing..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  
  brew doctor
  
  echo "Installed"
fi

echo "\nCopying configs"
brew install stow --quiet
mkdir ~/.ssh ~/.config

stow -R fish git homebrew ssh iterm2

echo "\nBundling brew formulae and other goodies"
brew bundle --global

echo "\nCleanup new shell"
touch ~/.hushlogin

echo "\nCleanup brew artefacts"
brew cleanup

echo "\nChange the shell to fish"
if ! grep --quiet $(which fish) /etc/shells; then
  sudo sh -c "echo $(which fish) >> /etc/shells"
  chsh -s $(which fish)
fi

echo "\n All done."

echo "\nPress any key to restart..."
read -p  "" -n1 -s

reboot
