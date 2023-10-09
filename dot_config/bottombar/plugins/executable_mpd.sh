#! /usr/bin/env bash

# ❯ mp-cli --format text
# volume=91
# state=pause
# artist=Grateful Dead
# album=One From The Vault (Disc 1) [Live]
# title=Introduction
# position=0
# queue_count=16
# elapsed=00:19
# track_length=00:47
# repeat=off
# random=off
# single=off
# consume=off

status=$(mp-cli --format text)

while IFS='=' read -r key value; do
	case "$key" in
	'volume') volume="$value" ;;
	'state') state="$value" ;;
	'artist') artist="$value" ;;
	'album') album="$value" ;;
	'title') title="$value" ;;
	'elapsed') elapsed="$value" ;;
	'track_length') track_length="$value" ;;
	esac
done <<<"$status"

if [ "${state}" == "stop" ]; then
	output=""
	icon=""
else
	if [ "${state}" == "play" ]; then
		icon=""
	else
		icon=""
	fi

	output="${artist} • ${title} • ${album} • [${elapsed}/${track_length}]"
fi

bottombar -m \
	--set mpd icon="${icon}" \
	--set mpd label="${output}"
