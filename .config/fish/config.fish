# Remove the newcomer fish greeting.
set fish_greeting ""

# Set yarn global path.
set PATH $PATH "/Users/"$USER"/.config/yarn/global/node_modules/.bin"

# Make gpg agent auto run for signing commits.
if [ -z (pgrep gpg-agent) ]
    eval $gpgstart
end > /dev/null
