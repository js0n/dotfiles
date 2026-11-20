#!/bin/bash

# Local clock using the timezone geolocated from the external IP (falls back
# to the system timezone until the first successful lookup).

CACHE="$HOME/.cache/sketchybar/geo_tz"

# Kick off a background refresh if the cached zone is missing or >15 min old
if [ ! -f "$CACHE" ] || [ -n "$(find "$CACHE" -mmin +15 2>/dev/null)" ]; then
  ("$CONFIG_DIR/plugins/geo_tz.sh" >/dev/null 2>&1 &)
fi

TZ_GEO=$(cat "$CACHE" 2>/dev/null)
[ -n "$TZ_GEO" ] && export TZ="$TZ_GEO"

sketchybar --set clock.date label="$(date '+%a %d %b %Y')" \
           --set clock.time label="$(date '+%H:%M:%S %Z')"
