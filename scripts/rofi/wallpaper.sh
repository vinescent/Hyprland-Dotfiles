#!/bin/bash

wallpaper=$(find "$HOME/Pictures/wallpapers/" -printf '%f\n' | rofi -dmenu -p "Select Wallpaper")

monitor="$1"

case "$monitor" in
  "eDP-1")           $HOME/.config/scripts/wallpaper/eDP-1.sh $wallpaper;;
  "DP-2 & HDMI-A-1") $HOME/.config/scripts/wallpaper/DP-2.sh $wallpaper; $HOME/.config/scripts/wallpaper/HDMI-A-1.sh $wallpaper;;
  "DP-2")            $HOME/.config/scripts/wallpaper/DP-2.sh $wallpaper;;
  "HDMI-A-1")        $HOME/.config/scripts/wallpaper/HDMI-A-1.sh $wallpaper;;
esac
