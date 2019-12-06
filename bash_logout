#!/bin/bash

# Save history
PROMPT_COMMAND='history -a'
# Clear console on exit
[ "$SHLVL" == 1 ] && [ -x "$(command -v clear)" ] && clear