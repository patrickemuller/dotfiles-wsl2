#!/bin/bash

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

source_bash_files() {
  local file=""
  local i=""

  declare -r -a FILES_TO_SOURCE=(
    "bash_aliases"
    "bash_exports"
    "bash_functions"
    "bash_options"
    "bash_logout"
    "bash_prompt"
    "inputrc"
  )

  for i in ${!FILES_TO_SOURCE[*]}; do
    file="$HOME/.${FILES_TO_SOURCE[$i]}"
    [ -r "$file" ] && source "$file"
  done
}

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {
  source_bash_files
}

main

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Unset functions in order to not pollute the global space
unset -f main
unset -f source_bash_files

# Clear system messages (e.g.: system copyright notice, the
# date and time of the last login, the message of the day, etc.)
clear
