echo "Brewing apps and tools."

echo "Updating and upgrading Homebrew."
brew update

echo "Installing essentials."
brew install fish
brew install hub
brew install ssh-copy-id
brew install tmux
brew install tree
brew install wget

echo "Installing dev deps."
brew install heroku-toolbelt
brew install git-extras
brew install node

echo "Installing games and cool stuff."
brew install archey
brew install cmatrix
brew install cowsay
brew install figlet
brew install fortune
brew install homebrew/games/nethack
brew install sl
brew install toilet

echo "Cleaning up the Cellar."
brew cleanup

echo "Fish it."
if ! grep --quiet $(which fish) /etc/shells; then
  sudo sh -c "echo $(which fish) >> /etc/shells"
fi
chsh -s $(which fish)

echo "Successfully brewed everything.\n"
