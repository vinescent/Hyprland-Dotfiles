#!/usr/bin/env bash

monitor=$(printf "eDP-1\nDP-2 & HDMI-A-1\nDP-2\nHDMI-A-1" | rofi -dmenu -p "Select Mon")

$HOME/.config/scripts/rofi/wallpaper.sh "$monitor"
