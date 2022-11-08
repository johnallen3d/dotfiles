#!/usr/bin/env bash

osascript <<'END'
tell application "System Events"
  keystroke "a" using {shift down, command down}
end tell
END

# desire to refresh state after toogle
# sketchybar -m update
# sketchybar -m set zoom enabled off
# sketchybar -m set zoom enabled on
