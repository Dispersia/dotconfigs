#!/bin/sh
swayidle -w \
  timeout 300 'swaylock -c 000000' &

swayidle -w \
    timeout 480 'systemctl suspend' &
