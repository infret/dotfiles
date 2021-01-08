while true; do
  if [[ $(cat /sys/class/power_supply/BAT0/capacity) < "10" ]]; then
    while true; do
      echo 0 | sudo /usr/bin/tee "/sys/class/leds/tpacpi::power/brightness"
      sleep 1
      echo 255 | sudo /usr/bin/tee "/sys/class/leds/tpacpi::power/brightness"
      sleep 1
      if [[ $(cat /sys/class/power_supply/BAT0/capacity) > "9" ]]; then
        break
      fi
    done
  fi
  sleep 1m
done
