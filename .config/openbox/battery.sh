while true; do
  if [[ $(cat /sys/class/power_supply/BAT0/capacity) < "10" ]]; then
    while true; do
      echo 0 >/sys/class/leds/tpacpi::power/brightness
      sleep 1s
      echo 255 >/sys/class/leds/tpacpi::power/brightness
      sleep 1s
      if [[ $(cat /sys/class/power_supply/BAT0/capacity) > "10" ]]; then
        break
      fi
    done
  fi
  sleep 1m
done
