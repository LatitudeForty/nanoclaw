#!/bin/bash
GDRIVE="/Users/michael/Library/CloudStorage/GoogleDrive-murray.work.au@gmail.com/My Drive/Murray Shared"
LOCAL="/Users/michael/murray-shared"
LOG="/Users/michael/Library/Logs/murray-sync.log"

mkdir -p "$LOCAL"

for f in "$GDRIVE"/*; do
  [ -e "$f" ] || continue
  name=$(basename "$f")
  if [ ! -e "$LOCAL/$name" ] || [ "$f" -nt "$LOCAL/$name" ]; then
    cp -f "$f" "$LOCAL/$name" 2>>"$LOG" && echo "$(date '+%Y-%m-%d %H:%M:%S') Copied to local: $name" >>"$LOG"
  fi
done

for f in "$LOCAL"/*; do
  [ -e "$f" ] || continue
  name=$(basename "$f")
  if [ ! -e "$GDRIVE/$name" ] || [ "$f" -nt "$GDRIVE/$name" ]; then
    cp -f "$f" "$GDRIVE/$name" 2>>"$LOG" && echo "$(date '+%Y-%m-%d %H:%M:%S') Copied to GDrive: $name" >>"$LOG"
  fi
done
