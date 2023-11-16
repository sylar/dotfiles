#!/bin/sh

echo "\n macOS setup"

echo  "\nAdmin powers needed"
sudo -v

echo "\nConfig info needed"
USERNAME=$(whoami)

read -p "Computer Name: " COMPUTERNAME
read -p "Git name: " GITNAME
read -p "Git email: " GITEMAIL

# Create .gitconfig
sed "s/__USERNAME__/$USERNAME/g; s/__GITNAME__/$GITNAME/g; s/__GITEMAIL__/$GITEMAIL/g" "./templates/.gitconfig" > "./git/.gitconfig"

# Updating paths
sed "s/__USERNAME__/$USERNAME/g" "./templates/defaults.sh" > "./macos.sh"
chmod +x ./macos.sh

# Updating computer name and hostnames
sudo scutil --set ComputerName "$COMPUTERNAME"
sudo scutil --set LocalHostName "$COMPUTERNAME"
sudo scutil --set HostName "$COMPUTERNAME"

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
  
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew doctor
  
  echo "Installed"
fi

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/$USERNAME/.zprofile
source /Users/$USERNAME/.zprofile

brew install stow --quiet

echo "\nCopying configs"
mkdir ~/.ssh ~/.config

stow -R fish git homebrew ssh iterm2h

echo "\nBundling brew formulae and other goodies"
brew bundle --global --no-lock

sudo xcodebuild -license accept

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

sudo reboot
