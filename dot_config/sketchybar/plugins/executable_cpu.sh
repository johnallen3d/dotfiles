#!/usr/bin/env bash

cpu_usage="$(ps -axro pcpu | awk '{sum+=$1} END {print sum}')"
average_by_core=$(echo "${cpu_usage}/10" | bc)

sketchybar -m --set cpu label="${average_by_core}%"
