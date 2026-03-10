#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <color_file_name>"
  exit 1
fi

COLOR="$1"

cp -f "$HOME/.config/color/${COLOR}.css" "$HOME/.config/color/color.css"

"/home/vinescent/.config/scripts/reload.sh"
