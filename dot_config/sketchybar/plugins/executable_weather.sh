#!/bin/bash

conditions="$($HOME/.cargo/bin/conditions current)"
icon=$(echo "$conditions" | jq -r .icon)
temp=$(echo "$conditions" | jq -r .temp)

[[ $DEBUG = true ]] && echo "$temp"

sketchybar -m \
  --set weather_logo icon="${icon}" \
  --set weather label="${temp}°F"
