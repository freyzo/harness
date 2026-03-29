#!/bin/sh
# Guards 0.json integrity via SHA256.
# Usage: chmod +x guard.sh && ./guard.sh &
cd "$(dirname "$0")"
BACKUP=$(cat 0.json)
H=$(shasum -a 256 0.json | cut -d' ' -f1)
while sleep 2; do
  N=$(shasum -a 256 0.json | cut -d' ' -f1)
  if [ "$H" != "$N" ]; then
    printf '%s' "$BACKUP" > 0.json
  fi
done
