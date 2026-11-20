#!/bin/bash

source "$CONFIG_DIR/colors.sh"

# Wi-Fi status icon like the native menu bar one: off / disconnected /
# signal strength in four steps. RSSI comes from system_profiler since the
# airport CLI was removed and wdutil needs sudo.

IFACE=$(networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}')

POWER=$(networksetup -getairportpower "$IFACE" 2>/dev/null | awk '{print $NF}')

if [ "$POWER" != "On" ]; then
  sketchybar --set "$NAME" icon=󰤮 icon.color=$MUTED
  exit 0
fi

RSSI=$(system_profiler SPAirPortDataType -json 2>/dev/null | jq -r --arg iface "$IFACE" '
  .SPAirPortDataType[0].spairport_airport_interfaces[]
  | select(._name == $iface)
  | .spairport_current_network_information.spairport_signal_noise // empty' \
  | awk '{print $1}')

if [ -z "$RSSI" ]; then
  # Powered on but not connected
  sketchybar --set "$NAME" icon=󰤯 icon.color=$MUTED
  exit 0
fi

if   [ "$RSSI" -ge -50 ]; then ICON=󰤨
elif [ "$RSSI" -ge -60 ]; then ICON=󰤥
elif [ "$RSSI" -ge -70 ]; then ICON=󰤢
elif [ "$RSSI" -ge -80 ]; then ICON=󰤟
else                           ICON=󰤯
fi

sketchybar --set "$NAME" icon="$ICON" icon.color=$TEXT
