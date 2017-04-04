#!/bin/sh

echo "\nLet me do some magic.\n"

./defaults/osx.sh

./homebrew/install.sh

./configs/atom.sh
./configs/yarn.sh

cp -rv .config ~
cp -rv .atom ~
cp -rv fonts/*.* ~/Library/Fonts/

echo " All done!.\n"
