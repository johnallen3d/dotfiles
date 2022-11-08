#!/usr/bin/env bash

status="$(mpc status)"

if [ "$(echo "${status}" | wc -l | tr -d ' ')" == "1" ]; then
  output=""
  icon=""
else
  artist=$(mpc current -f %artist%)
  song=$(mpc current -f %title%)

  if [ "$(echo "${status}" | grep -c playing)" == "1" ]; then
    icon=""
  else
    icon=""
  fi

  output="${artist} • ${song}"
fi

sketchybar -m \
  --set mpd icon="${icon}" \
  --set mpd label="${output}"
