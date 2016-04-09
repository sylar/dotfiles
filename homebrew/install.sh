#!/bin/sh

# Install Homebrew if it's not already present.
if command -v brew >/dev/null 2>&1; then
  echo "You are ready to brew.\n"
else
  echo "Homebrew is installing. (http://brew.sh)"
  echo "Please install the command line tools when prompted, and press 'enter' after it's done.\n"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
  echo "Homebrew successfully installed.\n"
fi

# Run the provided brewfile.
./brew-install.sh

# Run the provided caskfile.
./brew-cask-install.sh

echo "Homebrew install done.\n"
