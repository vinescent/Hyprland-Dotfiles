#!/bin/bash

option=$(printf "Dynamic Island\nIslands\nMonochrome\nDefault" | rofi -dmenu -p "Waybar Config")

# Exits early if no arg selected
[ -z "$option" ] && exit 0

script="$HOME/.config/scripts/switch-waybar.sh"

"$script" "$option" "$option"

pkill -x rofi || true
