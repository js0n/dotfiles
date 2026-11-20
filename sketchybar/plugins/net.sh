#!/bin/bash

# Download/upload rate on the interface carrying the default route, in decimal
# bits per second (Kb/s, Mb/s, Gb/s) like ISPs and speed tests. The previous
# byte counters are cached between runs to compute the rate.

CACHE="$HOME/.cache/sketchybar/net"
mkdir -p "$(dirname "$CACHE")"

IFACE=$(route -n get default 2>/dev/null | awk '/interface:/ {print $2}')
if [ -z "$IFACE" ]; then
  sketchybar --set net.rx label="--" --set net.tx label="--"
  exit 0
fi

# Ibytes and Obytes from the interface's link-level row
read -r RX TX <<< "$(netstat -ibn -I "$IFACE" | awk '/<Link#/ {print $7, $10; exit}')"
NOW=$(date +%s)

read -r P_IFACE P_TIME P_RX P_TX < "$CACHE" 2>/dev/null
echo "$IFACE $NOW $RX $TX" > "$CACHE"

# First sample, interface change, or counter reset: wait for the next run
if [ "$P_IFACE" != "$IFACE" ] || [ -z "$P_TIME" ] || [ "$NOW" -le "$P_TIME" ] \
   || [ "$RX" -lt "$P_RX" ] || [ "$TX" -lt "$P_TX" ]; then
  exit 0
fi

rate() {
  awk -v b="$1" -v s="$2" 'BEGIN {
    v = b * 8 / s; split("b/s Kb/s Mb/s Gb/s", u, " "); i = 1
    while (v >= 1000 && i < 4) { v /= 1000; i++ }
    if (v < 10 && i > 1) printf "%.1f %s", v, u[i]; else printf "%d %s", v, u[i]
  }'
}

ELAPSED=$((NOW - P_TIME))
sketchybar --set net.rx label="$(rate $((RX - P_RX)) $ELAPSED)" \
           --set net.tx label="$(rate $((TX - P_TX)) $ELAPSED)"
