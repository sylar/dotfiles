#!/bin/sh

printf "Configuring global git settings."

cp ./assets/.gitfiles/.gitconfig ~
cp ./assets/.gitfiles/.gitignore.global ~

printf "Configured global git settings."
