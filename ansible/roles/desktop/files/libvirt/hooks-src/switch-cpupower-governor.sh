#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

governor="$([[ "$2" = "prepare" ]] && echo "performance" || echo "powersave")"
cpupower frequency-set -g "$governor"
