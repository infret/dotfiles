[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx /usr/bin/openbox-session &> /dev/null
 
