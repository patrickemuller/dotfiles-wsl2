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

# copy bash_files
for i in ${!FILES_TO_SOURCE[*]}; do
  file="$HOME/.${FILES_TO_SOURCE[$i]}"
  echo "Copying $file ..."
  cp -r ${FILES_TO_SOURCE[$i]} $file
done

echo "Installing Git Auto Completion"
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

echo "Installing APT FAST"
sudo add-apt-repository ppa:apt-fast/stable
sudo apt-get update
sudo apt-get -y install apt-fast

echo "Installing Gnome Tweaks Tool"
sudo apt-fast -y install gnome-tweaks

echo "Install Tilix & restore configuration ..."
sudo apt-fast -y install tilix
dconf load /com/gexperts/Tilix/ < tilix.dconf

echo "Installing basic ZSH plugins"
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k

echo "Installing Powerlevel10k ZSH theme"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

echo "Installing Rbenv and Ruby-build (always good to have, and also some packages for Rails Environment)"
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.zshrc

echo "Creating Projects folder inside Home"
cd ~ && mkdir Projects

echo "Installing Postman App"
snap install postman

echo "Installing Flameshot GUI screenshot"
sudo apt install flameshot
gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'flameshot'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'flameshot gui'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding 'Print'

echo "Configuring Linux to set data by local-time (fixes different timezone for dual-boot)"
timedatectl set-local-rtc 1 --adjust-system-clock

echo "Installing PEEK screen recorder"
sudo add-apt-repository ppa:peek-developers/stable
sudo apt update -y
sudo apt-fast -y peek

echo "Small tweaks for Ubuntu interface"
gsettings set org.gnome.shell.window-switcher app-icon-mode 'app-icon-only'
gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.gnome.desktop.peripherals.mouse accel-profile flat
gsettings set org.gnome.desktop.peripherals.mouse speed 0
gsettings set org.gnome.settings-daemon.plugins.power lid-close-battery-action nothing
gsettings set org.gnome.mutter center-new-windows 'true'

echo "Install Spotify Client"
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-fast update
sudo apt-fast -y install spotify-client

echo "Downloading GitKraken Git GUI on ~/Downloads"
curl -fsSL https://release.gitkraken.com/linux/gitkraken-amd64.deb -o ~/Downloads/git_kraken.deb

echo "Downloading Slack on ~/Downloads"
curl -fsSL https://downloads.slack-edge.com/linux_releases/slack-desktop-4.4.3-amd64.deb -o ~/Downloads/slack.deb

echo "Downloading Zoom on ~/Downloads"
curl -fsSL https://zoom.us/client/latest/zoom_amd64.deb -o ~/Downloads/zoom.deb

echo "Downloading Discord on ~/Downloads"
curl -fsSL https://discord.com/api/download?platform=linux&format=deb -o ~/Downloads/discord.deb

echo "Installing Docker & Docker Compose"
curl -fsSL https://get.docker.com -o ~/Downloads/get-docker.sh
sudo sh ~/Downloads/get-docker.sh
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Configuring Docker namespace files"
sudo rm /etc/subgid && sudo touch /etc/subgid
sudo rm /etc/subuid && sudo touch /etc/subuid
echo "$LOGNAME:1000:1" | sudo tee -a /etc/subgid /etc/subuid
echo "$LOGNAME:100000:65536" | sudo tee -a /etc/subgid /etc/subuid

sudo touch /etc/docker/daemon.json
echo "
{
	\"userns-remap\": \"$LOGNAME\"
}
" | sudo tee -a /etc/docker/daemon.json

sudo systemctl restart docker

echo "Done, now you need to logout from your user and log back again"
