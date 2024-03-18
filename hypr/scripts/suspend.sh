#!/bin/sh
swayidle -w \
  timeout 180 'swaylock -c 000000' &

swayidle -w \
    timeout 300 'systemctl suspend' &
