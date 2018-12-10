#! /usr/bin/env bash

command -v hub &> /dev/null && eval "$(hub alias -s)"

# too many times have i typed gs and stashed when i meant to type gst!!!
unalias gs &> /dev/null
