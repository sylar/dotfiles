#!/bin/sh

echo "\nLet me do some magic.\n"

./defaults/osx.sh

./homebrew/install.sh

./extra/extra.sh

cp -rv .config ~

echo " All done! Enjoy.\n"
