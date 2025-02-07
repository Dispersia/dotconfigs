#!/bin/sh

selected=$(clipman pick -t wofi)

if [ -n "$selected" ]; then
  echo -n "$selected" | wl-copy
  wl-paste
fi
