#!/bin/bash

option=$(printf " Waybar\n Hyprland\n󰸉 Wallpaper\n󰆿 Mouse Follow\n Game Mode\n Color" | rofi -dmenu -p "Edit Config")

case "$option" in
   " Hyprland")   "$HOME/.config/scripts/rofi/hyprland.sh" ;;
   " Waybar") 	   "$HOME/.config/scripts/rofi/waybar.sh" ;;
   "󰸉 Wallpaper")  "$HOME/.config/scripts/rofi/monitor.sh" ;;
   "󰆿 Mouse Follow")"$HOME/.config/scripts/mouse-follow.sh" ;;
   " Game Mode")  "$HOME/.config/scripts/gamemode.sh" ;;
   " Color")      "$HOME/.config/scripts/rofi/color.sh" ;;
esac

if pgrep -x "rofi" > /dev/null
then
    pkill rofi
else
    rof -show drun
fi
