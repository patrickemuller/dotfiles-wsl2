#!/bin/bash

echo "Installing Git Auto Completion"

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

declare file=""
declare i=""
declare -r -a FILES_TO_SOURCE=(
  "gitconfig"
  "bash_aliases"
  "bash_exports"
  "bash_functions"
  "bash_logout"
  "bash_options"
  "bash_profile"
  "bash_prompt"
  "bashrc"
  "inputrc"
)

# copy bash_files
for i in ${!FILES_TO_SOURCE[*]}; do
  file="$HOME/.${FILES_TO_SOURCE[$i]}"
  echo "Copying $file ..."
  cp -r ${FILES_TO_SOURCE[$i]} $file
done

echo "Restoring Tilix configuration ..."
dconf load /com/gexperts/Tilix/ < tilix.dconf

echo "Done!"
