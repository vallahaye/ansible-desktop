#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

cpulist="$([[ "$2" = "prepare" ]] && echo "0-1,7-8" || echo "0-15")"
for unit in init.scope system.slice user.slice; do
  systemctl set-property --runtime -- "$unit" AllowedCPUs="$cpulist"
done
