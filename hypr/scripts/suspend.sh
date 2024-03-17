#!/bin/sh
swayidle -w \
  timeout 60 'swaylock -c 000000' &

swayidle -w \
    timeout 90 'systemctl suspend' &
