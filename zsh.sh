#!/bin/bash

declare file=""
declare i=""
declare -r -a FILES_TO_SOURCE=(
  "zshrc"
)

echo "Installing ZSH"
sudo apt install zsh
chsh -s $(which zsh)

echo "Installing ZSH"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# copy bash_files
for i in ${!FILES_TO_SOURCE[*]}; do
  file="$HOME/.${FILES_TO_SOURCE[$i]}"
  echo "Copying $file ..."
  cp -r ${FILES_TO_SOURCE[$i]} $file
done

exec $SHELL

