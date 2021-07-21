#!/bin/sh

# Install Snap packages

sudo snap install spotify
sudo snap install signal-desktop
sudo snap install caprine
sudo snap install telegram-desktop
sudo snap install postman


# Install Sublime Text
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# Install nodejs
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install other
sudo apt install curl
sudo apt install hub

# Install krypt.co
curl https://krypt.co/kr | sh
kr pair 

# Install fish shell
sudo apt-get install fish
chsh -s /usr/bin/fish
cp -rv ./assets/.config ~