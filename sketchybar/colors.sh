#!/bin/bash

# One palette for the whole bar (0xAARRGGBB), taken from Tokyo Night
# (https://github.com/folke/tokyonight.nvim) so the bar, window borders, and
# terminal share a scheme. The bar is clear, so text uses the dark tones from
# the light variants (Tokyo Night Light/Day).

export TRANSPARENT=0x00000000

export TEXT=0xff343b58     # light fg: primary text and icons
export SUBTEXT=0xff6172b0  # day fg_dark: secondary text, dates, extra clocks, disk tag
export MUTED=0xff9699a3    # light comment: inactive state, wifi off or disconnected
export HIGHLIGHT=0xff2e7de9  # day blue: focused workspace number

export ACCENT_CPU=0xffb15c00  # day orange
export ACCENT_GPU=0xff2e7de9  # day blue
export ACCENT_RAM=0xff587539  # day green
export ACCENT_RX=0xff007197   # day cyan: network download
export ACCENT_TX=0xff8c6c3e   # day yellow: network upload

# Graph fills: the accents at low alpha
export FILL_CPU=0x30b15c00
export FILL_GPU=0x202e7de9
export FILL_RAM=0x30587539
export FILL_RX=0x30007197
export FILL_TX=0x208c6c3e
