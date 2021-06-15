#!/bin/bash
bat() {
  batstat="$(cat /sys/class/power_supply/BAT0/status)"
  battery="$(cat /sys/class/power_supply/BAT0/capacity)"
  if [ $batstat = 'Charging' ]
  then
    echo -e "${battery}%+"
  elif [ "${battery}" -lt "20"]
    then
      echo -e "+@fg=1; ${battery}%"
    else
      echo -e "+@fg=0; ${battery}%"
  fi
}

mem(){
  mem="$(free --mega | grep Mem | awk '{print $3}')"
  if [ "${mem}" -gt "3500" ]
  then
    echo -e "+@fg=1; ${mem}M"
  else
    echo -e "+@fg=0; ${mem}M"
  fi
}

vol(){
  vol="$(pactl list sinks | grep '^[[:space:]]Volume:' | awk '{print $5}')"
  stat="$(pacmd list-sinks | grep 'muted: yes')"
  if [ -z $stat ];
  then
    if [ "${vol%?}" -gt "32" ]
    then 
      echo -e "+@fg=1; ${vol}"
    else
      echo -e "+@fg=0; ${vol}"
    fi
  else
    echo -e "+@fg=1; 0%"
  fi
}
while :; do
  echo -e "$(bat) $(mem) $(vol)"
  sleep 1
done
