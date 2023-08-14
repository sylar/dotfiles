#!/bin/sh
printf "Installing brew packages"
cd ./lib/homebrew
brew bundle
printf "Common brew packages installed."

printf "Configuring the fish shell."
if ! grep --quiet $(which fish) /etc/shells; then
  sudo sh -c "printf "%s"  $(which fish) >> /etc/shells"
fi
chsh -s $(which fish)
printf "Fish shell configured."

cd ../../scripts
printf "Successfully brewed common tools."
