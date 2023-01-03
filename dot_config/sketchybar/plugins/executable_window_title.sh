#!/bin/bash

WINDOW_TITLE=$(yabai -m query --windows --window | jq -r '.app')

# WINDOW_TITLE=$($yabai -m query --windows --window | jq -r '.title')

# if [[ $WINDOW_TITLE = "" ]]; then
#   WINDOW_TITLE=$($yabai -m query --windows --window | jq -r '.app')
# fi

# if [[ ${#WINDOW_TITLE} -gt 50 ]]; then
#   WINDOW_TITLE=$(echo "$WINDOW_TITLE" | cut -c 1-50)
# fi

sketchybar -m --set $NAME label="${WINDOW_TITLE}"
