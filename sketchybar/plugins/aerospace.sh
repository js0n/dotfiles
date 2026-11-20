#!/bin/bash

# $1 is the workspace id this item represents.
# FOCUSED_WORKSPACE is set by the aerospace_workspace_change event;
# fall back to querying aerospace directly (e.g. on initial load).
FOCUSED_WORKSPACE="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused)}"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
	# Focused: lavender cell, light text
	sketchybar --animate tanh 12 \
	           --set "$NAME" drawing=on \
	                         background.drawing=on \
	                         label.color=0xffeff1f5
elif aerospace list-workspaces --monitor all --empty no | grep -qx "$1"; then
	# Occupied: plain dark number, no fill
	sketchybar --animate tanh 12 \
	           --set "$NAME" drawing=on \
	                         background.drawing=off \
	                         label.color=0xff4c4f69
else
	sketchybar --set "$NAME" drawing=off
fi
