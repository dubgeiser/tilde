#!/usr/bin/env bash

#
# Print a list of colors usable in tmux configuration.
#

for i in {0..255} ; do
    printf "\x1b[38;5;${i}m##### colour${i} #####\n"
done

