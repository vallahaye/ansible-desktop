#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

APP="libvirt-domain-$1-power-save-blocker"
TMPFILE="/tmp/$APP.systemd-run"
if [[ "$2" = "started" ]]; then
  REASON="libvirt domain '$1' is running"
  systemd-run --uid=1000 --gid=1000 --scope \
    -E DBUS_SESSION_BUS_ADDRESS='unix:path=/run/user/1000/bus' \
    python - > "$TMPFILE" 2>&1 <<EOF &
from signal import signal, sigwait, SIGTERM

import dbus


def inhibit(s, dpms):
  s_cookie = s.Inhibit("$APP", "$REASON")
  dpms_cookie = dpms.Inhibit("$APP", "$REASON")
  return s_cookie, dpms_cookie

def uninhibit(s, s_cookie, dpms, dpms_cookie):
  s.UnInhibit(s_cookie)
  dpms.UnInhibit(dpms_cookie)

def main():
  bus = dbus.SessionBus()
  s = bus.get_object("org.freedesktop.ScreenSaver",
    "/org/freedesktop/ScreenSaver")
  dpms = bus.get_object("org.freedesktop.PowerManagement",
    "/org/freedesktop/PowerManagement/Inhibit")
  s_cookie, dpms_cookie = inhibit(s, dpms)
  signal(SIGTERM, lambda _: uninhibit(s, s_cookie, dpms, dpms_cookie))
  sigwait((SIGTERM,))


if __name__ == "__main__":
  main()
EOF
else
  # shellcheck disable=SC2064
  trap "rm -f '$TMPFILE'" EXIT
  systemctl stop "$(gawk '{ print $5 }' "$TMPFILE")"
fi
