#!/bin/bash

# One palette for the whole bar (0xAARRGGBB). Neutrals come from Catppuccin
# Latte; the accents are its peach/blue/green blended halfway toward SUBTEXT so
# they sit quietly next to the grays while the graph lines stay distinguishable.

export TRANSPARENT=0x00000000

export TEXT=0xff4c4f69     # primary text and icons
export SUBTEXT=0xff6c6f85  # secondary text: dates, extra clocks, disk tag
export MUTED=0xff9ca0b0    # inactive state: wifi off or disconnected
export SURFACE=0xffd4d4d4  # focused workspace cell (pure neutral gray)

export ACCENT_CPU=0xffb56948
export ACCENT_GPU=0xff456abd
export ACCENT_RAM=0xff568758

# Graph fills: the accents at low alpha
export FILL_CPU=0x30b56948
export FILL_GPU=0x20456abd
export FILL_RAM=0x20568758
