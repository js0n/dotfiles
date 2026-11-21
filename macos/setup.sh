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

# Xcode (install it from the App Store first): use the full app rather than the
# command line tools, and fetch the Metal toolchain that Xcode 26+ ships separately.
# Unreal Engine needs both.
XCODE=/Applications/Xcode.app
if [ -d "$XCODE" ]; then
  sudo xcode-select -s "$XCODE"
  sudo xcodebuild -license accept
  xcodebuild -runFirstLaunch
  xcodebuild -showComponent MetalToolchain | grep -q 'Status: installed' ||
    xcodebuild -downloadComponent MetalToolchain
else
  echo "Xcode not found in /Applications; skipping Xcode setup"
fi

pmset -g | grep -E '^ (sleep|displaysleep|autorestart) '
sysctl iogpu.wired_limit_mb
xcodebuild -version 2>/dev/null | head -1 || true
