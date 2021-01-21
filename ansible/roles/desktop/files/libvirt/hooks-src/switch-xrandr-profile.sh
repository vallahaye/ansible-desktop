#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

_sudo() {
  sudo -u '#1000' 'DISPLAY=:0' -- "$@"
}

main() {
  mid_monitor="$(_sudo xrandr -q | gawk '$2 == "connected" && $1 ~ /(-[0-9]+){2}$/ { print $1 }')"
  if [[ "$2" = "started" ]]; then
    _sudo xrandr --output "$mid_monitor" --off --output HDMI-0 --primary --output DP-0 \
      --right-of HDMI-0
  else
    _sudo xrandr --output "$mid_monitor" --auto --primary --right-of HDMI-0 --output DP-0 \
      --right-of "$mid_monitor"
  fi
}

main "$@"
