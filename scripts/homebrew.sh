#!/bin/sh

printf "%s\n\n" "Homebrew check."

# Install Homebrew if it's not already present.
if command -v brew >/dev/null 2>&1; then
  printf "You are ready to brew."
  printf "Updating and upgrading Homebrew."
  brew update
  brew upgrade
else
  printf "Homebrew is installing. (http://brew.sh)"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
  printf "Homebrew successfully installed."
fi

# Install common brew packages.
./lib/homebrew/common.sh
sudo xcodebuild -license accept


brew cleanup

printf "Homebrew apps and tool successfully installed."
