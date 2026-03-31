#!/bin/sh
cd "$(dirname "$0")" || exit 1
[ -f 0.json ] || exit 1
if [ "$1" != "--daemon" ]; then
  "$0" --daemon </dev/null >/dev/null 2>&1 &
  exit 0
fi
BACKUP=$(cat 0.json)
H=$(cksum 0.json)
while sleep 2; do
  [ -f .guard-off ] && continue
  [ -f 0.json ] || { printf '%s' "$BACKUP" > 0.json; continue; }
  N=$(cksum 0.json)
  [ "$H" != "$N" ] && printf '%s' "$BACKUP" > 0.json
done
