#!/usr/bin/env bash

#Reload waybar:
if pgrep -x waybar >/dev/null; then
  pkill -x waybar || true
  for i in {1..20}; do
    pgrep -x waybar >/dev/null || break
    sleep 0.05
  done
fi

waybar & disown
