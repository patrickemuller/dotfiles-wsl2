# Dotfiles and aliases for Linux

## Pre-requisites

- Install [Oh My ZSH](https://github.com/ohmyzsh/ohmyzsh)
- Install [Tilix Terminal](https://gnunn1.github.io/tilix-web)

## What is included in this Dotfiles?

- Auto completion from history (start typing the command and use arrow keys to autocomplete)
- Auto completion for Git commands
- Alias for Git, Rails, Docker & some useful functions to be used on terminal
- tilix.dconf file to match usual commands from iTerm on MacOS
- TLP config file to improve battery life on INTEL processors (can may work for AMD processors)

## Screenshot of terminal

![monokai_dark_tilix_powerline01k](https://user-images.githubusercontent.com/1644530/81022753-ceff9c80-8e44-11ea-85d3-acf618fbd9e5.png)


## Installation

Install some Oh My ZSH plugins

```shell
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k
```

I'm using the powerlevel10k theme for my ZSH, so you gonna need to install the recommended fonts (I'm installing all
of them, just in case, but the DOWNLOAD IS HUGE, more than 6 GiB of fonts)

Automatic script for fonts
```shell
$ cd ~/Downloads
$ git clone https://github.com/ryanoasis/nerd-fonts.git && cd nerd-fonts && ./install.sh
```

Manual installation for fonts

Check this link to original Powerline10k instructions

https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k


Now you can install the Powerlevel10k Theme for ZSH
```shell
$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

Clone the repository whatever you want using:

```shell
$ git clone git@github.com:patrickemuller/dotfiles-linux-oh-my-zsh.git
```

Run the command sh to copy files to your $HOME directory:

```shell
$ ./setup.sh
```

Logout from your user and login back so the configs can take effect
