#!/bin/sh

linux_get_bat ()
{
    bf=$(cat $BAT_FULL)
    bn=$(cat $BAT_NOW)
    echo $(( 100 * $bn / $bf ))
}

battery_status()
{
        BATPATH=/sys/class/power_supply/BAT0
        STATUS=$BATPATH/status
        BAT_FULL=$BATPATH/energy_full
        BAT_NOW=$BATPATH/energy_now
        if [ "$1" = `cat $STATUS` -o "$1" = "" ]; then
            linux_get_bat
        fi
}

BATTERY_STATUS=`battery_status $1`
[ -z "$BATTERY_STATUS" ] && exit
echo ${BATTERY_STATUS}%

