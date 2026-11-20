#!/bin/bash

# Free space in binary gigabytes (GiB), matching the RAM reading
AVAIL=$(df -k / | awk 'NR==2 {printf "%d", $4/1048576}')

sketchybar --set "$NAME" label="${AVAIL}G"
