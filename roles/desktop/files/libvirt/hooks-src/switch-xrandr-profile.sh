#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

_sudo() {
  sudo -u '#1000' 'DISPLAY=:0' -- "$@"
}

main() {
  if [[ "$2" = "started" ]]; then
    _sudo xrandr --output HDMI-0 --off
  else
    primary_monitor="$(_sudo xrandr --listmonitors | gawk 'NR > 1 && $2 ~ /^+\*/ { print $4 }')"
    _sudo xrandr --auto \
      --output "$primary_monitor" --right-of HDMI-0 \
      --output DP-0 --right-of "$primary_monitor"
  fi
}

main "$@"
