#!/bin/bash

echo "Installing ZSH"
sudo apt install zsh
chsh -s $(which zsh)

echo "Installing ZSH"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

exec $SHELL
