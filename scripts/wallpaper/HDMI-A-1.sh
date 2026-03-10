#!/usr/bin/env bash

WALLPAPER="$1"
WP_PATH="$HOME/Pictures/wallpapers/${WALLPAPER}"

# Sets wallpaper using IPC
awww img --transition-type wipe --transition-angle 30 --transition-step 90 $WP_PATH -o HDMI-A-1

# Update pywal terminal colors
wal -i $WP_PATH

# update locked-screen symlink (use the correct variable and full >
ln -sfn "$WP_PATH" "$HOME/.config/hypr/hyprlock.png"
