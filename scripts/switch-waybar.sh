#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <config_name> <style_name>"
  exit 1
fi

CONFIG_NAME="$1"
STYLE_NAME="$2"

WAYBAR_CONFIG_DIR="$HOME/.config/waybar"
WAYBAR_CONFIG_FILE="$WAYBAR_CONFIG_DIR/config.jsonc"
WAYBAR_STYLE_FILE="$WAYBAR_CONFIG_DIR/style.css"

if [ ! -f "$WAYBAR_CONFIG_DIR/${CONFIG_NAME}.jsonc" ]; then
  echo "Config file '${CONFIG_NAME}.jsonc' does not exist!"
  exit 1
fi

if [ ! -f "$WAYBAR_CONFIG_DIR/${STYLE_NAME}.css" ]; then
  echo "Style file '${STYLE_NAME}.css' does not exist!"
  exit 1
fi

cp -f "$WAYBAR_CONFIG_DIR/${CONFIG_NAME}.jsonc" "$WAYBAR_CONFIG_FILE"
cp -f "$WAYBAR_CONFIG_DIR/${STYLE_NAME}.css" "$WAYBAR_STYLE_FILE"

.config/scripts/reload-waybar.sh
