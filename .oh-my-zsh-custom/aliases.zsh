# Brew uninstall
brew-remove-with-deps() {
  formula="$*"

  if [ "x$formula" = "x" ]
  then
     echo "Invalid empty parameter"
  else
     echo "Removing" "$formula" "and all its deps.."
     brew rm $formula
     brew rm $(join <(brew leaves) <(brew deps "$formula"))
  fi
}

#Disable Useless correction
unsetopt correct_all
unsetopt correct

# Clean caches.
alias cache-clean='gem clean cache && npm cache clean && bower cache clean && brew cask cleanup && brew cleanup'
alias no-duplicate='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user'
alias sketch-reset='rm /Users/andrei/Library/Application\ Support/com.bohemiancoding.sketch3/.license'

# Fun stuff.
alias starwars='telnet towel.blinkenlights.nl'
alias pingu='ping 8.8.8.8'
alias resource='source ~/.zshrc'
set -k


# Extra git aliases.
alias git=hub
alias gphm='git push heroku master'
alias gpom='git push origin master'
alias gpr='git pull-request'
alias stpp='subtree push --prefix'
alias pg=gp

# Command line pastibin
alias spr="curl -sF 'sprunge=<-' http://sprunge.us"
alias sprr="pbpaste | spr | pbcopy"

# Get IP
alias ip='ipconfig getifaddr en0'
alias eip='curl icanhazip.com'

# Extra on startup scripts
# eval "$(rbenv init - zsh --no-rehash)"
. `brew --prefix`/etc/profile.d/z.sh
eval "$(hub alias -s)"
