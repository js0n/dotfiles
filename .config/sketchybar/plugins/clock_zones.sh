#!/bin/bash

sketchybar --set clock.utc label="UTC $(TZ=UTC date '+%H:%M')" \
           --set clock.nyc label="NYC $(TZ=America/New_York date '+%H:%M')"
