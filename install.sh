#!/bin/sh

echo "\nLet me do some magic.\n"

./defaults/osx.sh

./homebrew/install.sh

./configs/atom.sh
./configs/npm.sh

cp -rv .config ~
cp -rv .atom ~

echo " All done!.\n"
