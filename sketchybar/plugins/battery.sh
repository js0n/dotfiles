#!/bin/bash

PERCENTAGE="$(pmset -g batt | grep -Eo '\d+%' | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ -z "$PERCENTAGE" ]; then
  sketchybar --set "$NAME" drawing=off
  exit 0
fi

# Horizontal Font Awesome battery glyphs (U+F240..U+F244), written as UTF-8
# byte escapes because the raw private-use characters are fragile in editors
case "${PERCENTAGE}" in
  9[0-9]|100) ICON=$(printf '\xef\x89\x80') ;;
  [6-8][0-9]) ICON=$(printf '\xef\x89\x81') ;;
  [3-5][0-9]) ICON=$(printf '\xef\x89\x82') ;;
  [1-2][0-9]) ICON=$(printf '\xef\x89\x83') ;;
  *)          ICON=$(printf '\xef\x89\x84') ;;
esac

if [ -n "$CHARGING" ]; then
  ICON="󱐋 ${ICON}"
fi

sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%"
