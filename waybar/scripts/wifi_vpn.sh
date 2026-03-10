#!/usr/bin/env bash
# prints only the icon (no JSON, no extra output)

# Get SSID + signal using nmcli (if present)
SSID=""
SIGNAL=""

if command -v nmcli >/dev/null 2>&1; then
  read -r SSID SIGNAL < <(
    nmcli -t -f ACTIVE,SSID,SIGNAL dev wifi |
    awk -F: '$1=="yes"{print $2, $3; exit}'
  )
fi

if [ -z "$SSID" ]; then
  state="disconnected"
else
  state="connected"
  SIGNAL=${SIGNAL:-0}
fi

# Detect VPN
vpn_active=false
if command -v nmcli >/dev/null 2>&1; then
  if nmcli -t -f TYPE connection show --active | grep -q '^vpn$'; then
    vpn_active=true
  fi
fi
if [ "$vpn_active" = false ]; then
  if ip link 2>/dev/null | grep -Eq '(^|\s)(tun[0-9]+|tap[0-9]+|wg[0-9]+|proton[0-9]+|ipv6leakintrf[0-9]+)\b'; then
    vpn_active=true
  fi
fi

# Determine 3-level signal
if [ "$state" = "disconnected" ]; then
  icon="󰖪"   # disconnected glyph
else
  if [ "$SIGNAL" -ge 70 ]; then
    level="max"
  elif [ "$SIGNAL" -ge 40 ]; then
    level="high"
  elif [ "$SIGNAL" -ge 34 ]; then
    level="medium"
  else
    level="low"
  fi

  if [ "$vpn_active" = true ]; then
    case "$level" in
      max)   	icon="󰤪" ;;
      high) 	icon="󰤧" ;;
      medium) 	icon="󰤤" ;;
      low)    	icon="󰤡" ;;
    esac
  else
    case "$level" in
      max)   	icon="󰤨" ;;
      high) 	icon="󰤥" ;;
      medium)   icon="󰤢" ;;
      low)    	icon="󰤟" ;;
    esac
  fi
fi

# OUTPUT: only the icon (single line)
printf '%s\n' "$icon"
