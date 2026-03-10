#!/bin/bash

option=$(printf "Binds\nDisplay\nBlur\nAutostart\nInput\nLook\nAnimations\nRules\nPermissions\nEnviorment Variables\nMain" | rofi -dmenu -p "Edit Hyprland")

case "$option" in
   "Binds") kitty --hold -e bash -ic config-binds;;
   "Display") kitty --hold -e bash -ic config-display;;
   "Blur") kitty --hold -e bash -ic config-blur;;
   "Autostart") kitty --hold -e bash -ic config-autostart;;
   "Input") kitty --hold -e bash -ic config-input;;
   "Look") kitty --hold -e bash -ic config-look;;
   "Animations") kitty --hold -e bash -ic config-animations;;
   "Rules") kitty --hold -e bash -ic config-rules;;
   "Permissions") kitty --hold -e bash -ic config-permissions;;
   "Enviorment Variables") kitty --hold -e bash -ic config-env;;
   "Main") kitty --hold -e bash -ic config-main;;
   #"--hold" openbs new windows, "-e bash -ic" makes sure terminal runs in interactive shell so aliases work
esac

if pgrep -x "rofi" > /dev/null
then
    pkill rofi
else
    rof -show drun
fi
