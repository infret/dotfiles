xrandr --newmode "1504x1000_60.00"  124.25  1504 1600 1752 2000  1000 1003 1013 1038 -hsync +vsync
xrandr --addmode eDP1 1504x1000_60.00
xrandr --output eDP1 --mode 1504x1000_60.00
xinput set-prop 11 335 1
xinput set-prop 11 315 1
xinput set-prop 11 343 0
xinput disable 'pointer:NTRG0001:01 1B96:1B05'
setxkbmap -layout us,ru -option grp:alt_shift_toggle
xset r rate 250 30
exec spectrwm
