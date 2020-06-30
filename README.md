# Dotfiles, aliases & development settings for Linux

## Whats included in this Dotfiles?

- Gnome Tweaks Tool
- [Git autocompletion](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash)
- [Powerlevel10k ZSH Theme](https://github.com/romkatv/powerlevel10k)
- [Tilix Terminal](https://gnunn1.github.io/tilix-web)
- tilix.dconf file to match usual commands from iTerm on MacOS
- [Apt Fast](http://patrickemuller.com/posts/installing-apt-fast-on-ubuntu)
- Alias for Git, Rails, Docker & some useful functions to be used on terminal

## What you need to install manually (and before everything else)
- sudo apt-get install chrome-gnome-shell
- [CPU power manager (intel_pstate only)](https://extensions.gnome.org/extension/945/cpu-power-manager/)

## Pre-requisites

- Install [Oh My ZSH](https://github.com/ohmyzsh/ohmyzsh)
  - PS.: You can ignore the startup configuration. Just leave the configuration empty, those things will be setup when `./install.sh` runs

## Optional steps

- Install [TLP & TLP GUI](http://patrickemuller.com/posts/tlp-config-file-for-intel-processors)
- Install [Conky & Conky manager](https://github.com/patrickemuller/dotfiles-linux-oh-my-zsh/wiki/Conky-Manager)
- Install [SimpleC skin for Conky](https://github.com/patrickemuller/conky-simplec-one)
- Download [a nice wallpaper](https://wallpaperflare.com)

## Screenshot of terminal

![monokai_dark_tilix_powerline01k](https://user-images.githubusercontent.com/1644530/81022753-ceff9c80-8e44-11ea-85d3-acf618fbd9e5.png)

## Installation

### Automatic script for fonts (easier to install, take lots of space)

I'm using the powerlevel10k theme for my ZSH, so you gonna need to install the recommended fonts (I'm installing all
of them, just in case, but the DOWNLOAD IS HUGE, more than 6 GiB of fonts)

```shell
cd ~/Downloads
git clone https://github.com/ryanoasis/nerd-fonts.git && cd nerd-fonts && ./install.sh
```

### Manual script for fonts (tricky to work, uses less space)

Check this link to original Powerline10k instructions

https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k


### Installing my configs

```shell
git clone git@github.com:patrickemuller/dotfiles-linux-oh-my-zsh.git
```

Run the command sh to copy files to your $HOME directory:

```shell
./setup.sh
```

Logout from your user and login back so the configs can take effect
