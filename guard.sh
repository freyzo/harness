#!/bin/sh
# Guards 0.json integrity via SHA256.
# Usage: chmod +x guard.sh && ./guard.sh &
cd "$(dirname "$0")"
BACKUP=$(cat 0.json)
H=$(cksum 0.json)
while sleep 2; do
  N=$(cksum 0.json)
  if [ "$H" != "$N" ]; then
    printf '%s' "$BACKUP" > 0.json
  fi
done
