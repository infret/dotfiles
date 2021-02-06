#!/bin/bash
SLEEP_SEC=5 
COUNT=0
while :; do
	let COUNT=$COUNT+1
        echo -e "$(date +'%a, %b %d %R') $(cat /sys/class/power_supply/BAT0/capacity)% $(vmstat -s -S m | grep 'free mem' | awk '{print $1;}')M"
        sleep $SLEEP_SEC
done
