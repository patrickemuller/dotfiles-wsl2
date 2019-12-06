# Dotfiles and aliases for Linux

## Pre-requisites

- Install [Tilix Terminal](https://gnunn1.github.io/tilix-web/)

## What is included in this Dotfiles?

- Auto completion from history (start typing the command and use arrow keys to autocomplete)
- Alias for Git commands
- Alias for Rails commands
- tilix.dconf file to match usual commands from iTerm on MacOS

## Example of actual PS1

![capture](https://user-images.githubusercontent.com/1644530/50055394-79363180-0135-11e9-9d6f-9b09a72d68c8.PNG)


## Installation

1. Clone the repository whatever you want using:

```
git clone git@github.com:patrickemuller/dotfiles-git-bash.git
```

2. Run the command sh to copy files to your $HOME directory:

```
sh setup.sh
```

3. Use the Tilix configuration

```
dconf load /com/gexperts/Tilix/ < tilix.dconf
```

4. Restart your Terminal
