#!/bin/bash

source "$CONFIG_DIR/colors.sh"

# $1 is the workspace id this item represents.
# FOCUSED_WORKSPACE is set by the aerospace_workspace_change event;
# fall back to querying aerospace directly (e.g. on initial load).
FOCUSED_WORKSPACE="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused)}"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
	# Focused: blue number
	sketchybar --animate tanh 12 \
	           --set "$NAME" drawing=on \
	                         background.drawing=off \
	                         label.color=$HIGHLIGHT
elif aerospace list-workspaces --monitor all --empty no | grep -qx "$1"; then
	# Occupied: plain dark number, no fill
	sketchybar --animate tanh 12 \
	           --set "$NAME" drawing=on \
	                         background.drawing=off \
	                         label.color=$TEXT
else
	sketchybar --set "$NAME" drawing=off
fi
