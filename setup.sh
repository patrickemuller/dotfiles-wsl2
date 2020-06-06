#!/bin/bash

echo "Installing Git Auto Completion"

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

declare file=""
declare i=""
declare -r -a FILES_TO_SOURCE=(
  "gitconfig"
  "bash_aliases"
  "bash_functions"
  "zshrc"
  "p10k.zsh"
)

# copy bash_files
for i in ${!FILES_TO_SOURCE[*]}; do
  file="$HOME/.${FILES_TO_SOURCE[$i]}"
  echo "Copying $file ..."
  cp -r ${FILES_TO_SOURCE[$i]} $file
done

echo "Copying TLP config file ..."
sudo cp tlp.conf /etc/tlp.conf

echo "Restoring Tilix configuration ..."
dconf load /com/gexperts/Tilix/ < tilix.dconf

echo "Configuring Docker namespace files"
sudo touch /etc/subgid
sudo touch /etc/subuid
echo "$LOGNAME:1000:1" | sudo tee -a /etc/subgid /etc/subuid
echo "$LOGNAME:100000:65536" | sudo tee -a /etc/subgid /etc/subuid

sudo touch /etc/docker/daemon.json
echo "
{
	\"userns-remap\": \"$LOGNAME\"
}
" | sudo tee -a /etc/docker/daemon.json

sudo systemctl restart docker

echo "Done!"
