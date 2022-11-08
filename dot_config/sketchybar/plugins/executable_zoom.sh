#!/usr/bin/env bash

status=$(~/.config/spacebar/zoom-mute-status)

# catppuccin-mocha
unmuted_color="0xffa6e3a1"
muted_color="0xfff38ba8"

# onedark-deep
# unmuted_color="0xff8bcd5b"
# muted_color="0xff992525"

if [[ "$status" = "UNMUTED" ]]; then
  icon=""
  color="$unmuted_color"
elif [[ "$status" = "MUTED" ]]; then
  icon=""
  color="$muted_color"
else
  icon=""
fi

sketchybar -m --set $NAME icon="$icon"
sketchybar -m --set $NAME icon.color="$color"
