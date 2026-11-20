#!/bin/bash

# Resolve the timezone of the current external IP and cache it. Only
# overwrites the cached zone on a successful, valid lookup; on failure it
# just bumps the mtime so we don't hammer the APIs while offline.

CACHE_DIR="$HOME/.cache/sketchybar"
CACHE="$CACHE_DIR/geo_tz"
mkdir -p "$CACHE_DIR"

TZ_NEW=$(curl -sf --max-time 3 https://ipapi.co/timezone)
[ -z "$TZ_NEW" ] && TZ_NEW=$(curl -sf --max-time 3 "http://ip-api.com/line/?fields=timezone")

if [ -n "$TZ_NEW" ] && [ -f "/usr/share/zoneinfo/$TZ_NEW" ]; then
  echo "$TZ_NEW" > "$CACHE"
else
  touch "$CACHE"
fi
