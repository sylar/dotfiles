# Remove the newcomer fish greeting.
set fish_greeting ""
set -x GPG_TTY (tty)

set -g fish_user_paths "/opt/homebrew/bin" $fish_user_paths
set -g fish_user_paths "/opt/homebrew/sbin" $fish_user_paths

source /opt/homebrew/opt/asdf/libexec/asdf.fish
