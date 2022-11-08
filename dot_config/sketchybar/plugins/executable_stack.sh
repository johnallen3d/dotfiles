#!/bin/bash

# Exit if Not in Stack
CURRENT=$(yabai -m query --windows --window | jq '.["stack-index"]')
if [[ $CURRENT -eq 0 ]]; then
  sketchybar -m set stack label ""
  sketchybar -m set stack_sep hidden on
  sketchybar -m set stack hidden on
  exit 0
fi

# Use Numbers in place of Dots if the Stack is greater than 10
# Use a larger font for the unicode dots
LAST=$(yabai -m query --windows --window stack.last | jq '.["stack-index"]')
if [[ $LAST -gt 10 ]]; then
  sketchybar -m set stack label_font "Iosevka Nerd Font:Bold:16.0"
  sketchybar -m set stack label $(printf "[%s/%s]" "$CURRENT" "$LAST")
  sketchybar -m set stack_sep hidden off
  sketchybar -m set stack hidden off
  exit 0
else
  sketchybar -m set stack label_font "Iosevka Nerd Font:Bold:22.0"
fi

# Create Stack Indicator
declare -a dots=()
for i in $(seq 0 $(expr $LAST - 1))
do
  # Theme 1
  # if [[ $i -lt $(expr $CURRENT - 1) ]]; then
    # dots+="◖"
  # elif [[ $i -gt $(expr $CURRENT - 1) ]]; then
    # dots+="◗"
  # elif [[ $i -eq $(expr $CURRENT - 1) ]]; then
    # dots+="●"
  # fi
  # Theme 2
  [[ $( expr $CURRENT - 1) -eq $i ]] && dots+="●" || dots+="○"
done

# Display Indicator
sketchybar -m set stack label $(printf "%s" ${dots[@]})
sketchybar -m set stack_sep hidden off
sketchybar -m set stack hidden off

