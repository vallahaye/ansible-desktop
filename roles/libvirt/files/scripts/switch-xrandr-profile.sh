#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

shopt -s expand_aliases
alias sudo="sudo -u '#1000' DISPLAY=:0"

if [[ "$2" = "started" ]]; then
  sudo xrandr --output HDMI-0 --off
else
  MONITOR="$(sudo xrandr --listmonitors | gawk '/+\*/ { print $4 }')"
  sudo xrandr --auto --output "$MONITOR" --right-of HDMI-0 \
    --output DP-0 --right-of "$MONITOR"
fi
