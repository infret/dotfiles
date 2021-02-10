#!/bin/bash
bat() {
batstat="$(cat /sys/class/power_supply/BAT0/status)"
battery="$(cat /sys/class/power_supply/BAT0/capacity)"
if [ $batstat = 'Unknown' ]; then
  batstat=""
  elif [[ $battery -le 19 ]]; then
    batstat="+@fg=1; "
  elif [[ $battery -ge 20 ]] && [[ $battery -le 39 ]]; then
    batstat=" "
  elif [[ $battery -ge 40 ]] && [[ $battery -le 69 ]]; then
    batstat=" "
  elif [[ $battery -ge 70 ]] && [[ $battery -le 89 ]]; then
    batstat=" "
  elif [[ $battery -ge 90 ]]; then
    batstat=" "
fi

echo "$batstat ${battery}%"
}

mem(){
  mem="$(free --mega | grep Mem | awk '{print $3}')"
  if [ "$mem" -gt "3500" ];
  then
    echo -e "+@fg=1;  ${mem}M"
  else 
    echo -e "+@fg=0;  ${mem}M"
  fi
}
vol(){
  vol="$(pactl list sinks | grep '^[[:space:]]Volume:' | awk '{print $5}')"
  stat="$(pacmd list-sinks | grep 'muted: yes')"
  if [ -z $stat ];
  then
    if [ "${vol%?}" -gt "32" ];
    then 
      echo -e "+@fg=1;  ${vol}"
    else
      echo -e "+@fg=0; 墳 ${vol}"
    fi
  else
    echo -e "+@fg=1; 婢 0%"
  fi
}
while :; do
  echo -e "$(bat) $(mem) $(vol)"
  sleep 1
done
