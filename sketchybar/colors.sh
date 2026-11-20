#!/bin/bash

# One palette for the whole bar (0xAARRGGBB), taken from Nord
# (https://www.nordtheme.com) so the bar, window borders, and terminal share
# a scheme. The bar is clear, so text uses Nord's dark Polar Night tones.

export TRANSPARENT=0x00000000

export TEXT=0xff2e3440     # nord0: primary text and icons
export SUBTEXT=0xff4c566a  # nord3: secondary text: dates, extra clocks, disk tag
export MUTED=0xff616e88    # nord3 bright: inactive state, wifi off or disconnected
export SURFACE=0xffd8dee9  # nord4: focused workspace cell

export ACCENT_CPU=0xffd08770  # nord12 orange
export ACCENT_GPU=0xff5e81ac  # nord10 blue
export ACCENT_RAM=0xffa3be8c  # nord14 green

# Graph fills: the accents at low alpha
export FILL_CPU=0x30d08770
export FILL_GPU=0x205e81ac
export FILL_RAM=0x30a3be8c
