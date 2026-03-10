#!/usr/bin/env bash

MON="eDP-1"

# Check current state
if hyprctl monitors | grep -q "^Monitor $MON"; then
    hyprctl keyword monitor "$MON, disable"
    state="off"
else
    hyprctl keyword monitor "$MON, 1920x1200@60, 0x0, 1.33"
   state="on"
fi

# Change waybar icon
$HOME/.config/waybar/scripts/mon_indicator.sh $state

# Restart waybar and hyprpaper
killall waybar
waybar & disown
