#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

GOVERNOR="$([[ "$2" = "prepare" ]] && echo "performance" || echo "powersave")"
cpupower frequency-set -g "$GOVERNOR"
