# Dotfiles and aliases for Linux

## Pre-requisites

- Install [Oh My ZSH](https://github.com/ohmyzsh/ohmyzsh)
- Install [Powerline Fonts](https://github.com/powerline/fonts)
- Install [Tilix Terminal](https://gnunn1.github.io/tilix-web/)

## What is included in this Dotfiles?

- Auto completion from history (start typing the command and use arrow keys to autocomplete)
- Auto completion for Git commands
- Alias for Git, Rails, Docker & some useful functions to be used on terminal
- tilix.dconf file to match usual commands from iTerm on MacOS

## Screenshot of terminal

![monokai_dark_tilix_powerline01k](https://user-images.githubusercontent.com/1644530/80638023-33ca8980-8a36-11ea-9cae-2ea7dc9d8a02.jpeg)


## Installation

1. Install some Oh My ZSH plugins

```shell
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
```

```shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

K is a plugin for a better LS commands on terminal

```shell
git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k
```

I'm using the powerlevel10k theme for my ZSH

```shell
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

1. Clone the repository whatever you want using:

```shell
git clone git@github.com:patrickemuller/dotfiles-linux-oh-my-zsh.git
```

2. Run the command sh to copy files to your $HOME directory:

```shell
./setup.sh
```

1. Logout from your user and login back
