#!/bin/bash

declare file=""
declare i=""
declare -r -a FILES_TO_SOURCE=(
  "gitconfig"
  "bash_aliases"
  "bash_functions"
  "zshrc"
  "p10k.zsh"
)

echo "Installing ZSH"
sudo apt install zsh
chsh -s $(which zsh)

echo "Installing APT FAST"
sudo add-apt-repository ppa:apt-fast/stable
sudo apt-get update
sudo apt-get -y install apt-fast

echo "Installing aria2 to improve wget speed"
sudo apt-get -y install aria2

echo "Installing ZSH"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# copy bash_files
for i in ${!FILES_TO_SOURCE[*]}; do
  file="$HOME/.${FILES_TO_SOURCE[$i]}"
  echo "Copying $file ..."
  cp -r ${FILES_TO_SOURCE[$i]} $file
done

echo "Installing Git Auto Completion"
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

echo "Installing basic ZSH plugins"
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k

echo "Installing Powerlevel10k ZSH theme"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

echo "Configuring GIT variables"
git config --global color.ui true

read -p "Enter Your Name: " username
git config --global user.name $username

read -p "Enter Your Email: " email
git config --global user.email $email

ssh-keygen -t ed25519 -C $email
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
echo "\n ======= COPY THIS SSH KEY TO YOUR GITHUB ACCOUNT ======== \n"
cat ~/.ssh/id_ed25519.pub
echo "\n ======= COPY THIS SSH KEY TO YOUR GITHUB ACCOUNT ======== \n"

echo "Installing Rbenv and Ruby-build (always good to have, and also some packages for Rails Environment)"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 3.0.2

curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

echo "Install PostgreSQL"
install postgresql postgresql-contrib
sudo service postgresql status
sudo service postgresql start
sudo passwd postgres

echo "DONE!!! Close your Terminal and open it again"
