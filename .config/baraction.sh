#!/bin/bash
while :; do
  echo -e "$(date +'%a, %b %d %R') $(cat /sys/class/power_supply/BAT0/capacity)% $(vmstat -s -S m | grep 'free mem' | awk '{print $1;}')M $(expr 100 + $(awk -F'[][]' '/dB/ { print $4 }' <(amixer sget Master) | cut -c -3))dB"
        sleep 2
done
