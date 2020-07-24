#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

CPULIST="$([[ "$2" = "prepare" ]] && echo "0-1,7-8" || echo "0-15")"
for cgroup in init.scope system.slice user.slice; do
  systemctl set-property --runtime -- "$cgroup" AllowedCPUs="$CPULIST"
done
