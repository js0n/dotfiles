#!/bin/bash

# System settings for running this Mac Studio as an always-on workstation.
# Needs sudo; safe to rerun.
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"

# Power: never sleep the system (the display still sleeps after 30 min),
# and power back on after an outage
sudo pmset -a sleep 0
sudo pmset -a displaysleep 30
sudo pmset -a autorestart 1

# GPU memory: raise the wired limit now and at every boot
PLIST=com.jwlabs.gpu-wired-limit.plist
sudo install -m 644 -o root -g wheel "$DIR/$PLIST" "/Library/LaunchDaemons/$PLIST"
sudo launchctl bootout system "/Library/LaunchDaemons/$PLIST" 2>/dev/null || true
sudo launchctl bootstrap system "/Library/LaunchDaemons/$PLIST"

pmset -g | grep -E '^ (sleep|displaysleep|autorestart) '
sysctl iogpu.wired_limit_mb
