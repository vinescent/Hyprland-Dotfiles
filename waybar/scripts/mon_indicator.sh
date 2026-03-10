#!/usr/bin/env bash
state="$1"

# If no argument, detect state from hyprctl
if [ -z "$state" ]; then
    if hyprctl monitors | grep -q "^Monitor eDP-1"; then
        state="on"
    else
        state="off"
    fi
fi

if [ "$state" = "on" ]; then
    mon=" 󰍹 "
elif [ "$state" = "off" ]; then
    mon=" 󰶐 "
else
    exit 1
fi

jq -cn --arg text "$mon" '{text: $text}'
