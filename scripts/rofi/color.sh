#!/bin/bash

option=$(printf "Pastel\nMonochrome" | rofi -dmenu -p "Edit Color")

case "$option" in
   "Pastel") /home/vinescent/.config/scripts/switch-color.sh pastel ;;
   "Monochrome") /home/vinescent/.config/scripts/switch-color.sh monochrome ;;
esac
