#!/usr/bin/env bash

# TODO: this does not work on Monterey?
status=$(defaults read com.apple.controlcenter "NSStatusItem Visible DoNotDisturb")

if [[ "$status" = "0" ]]; then
	icon=""
else
	icon=""
fi

sketchybar -m --set dnd icon="$icon"
