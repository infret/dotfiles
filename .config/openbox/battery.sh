while :
  do
    sleep 1000
    if [[ $(cat /sys/class/power_supply/BAT0/capacity) -lt "20" ]]; then
      while :
      do
        echo 0 > /sys/class/leds/tpacpi\:\:power/brightness
        sleep 1
        echo 255 > /sys/class/leds/tpacpi\:\:power/brightness
        sleep 1
      done
    fi
done
