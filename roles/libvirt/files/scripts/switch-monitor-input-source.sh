#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

shopt -s expand_aliases
alias xrandr="sudo -u '#1000' -- xrandr -d :0"

if [[ "$2" = "started" ]]; then
  xrandr --output HDMI-0 --off
else
  MONITOR="$(xrandr --listmonitors | gawk '/+\*/ { print $4 }')"
  xrandr --auto --output "$MONITOR" --right-of HDMI-0 --output DP-0 --right-of "$MONITOR"
fi
