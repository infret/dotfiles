alias ..='cd ..'
alias ls='ls -aCF --color=auto'
alias rm='rm -r'
alias mkdir='mkdir -pv'
alias free='free -mt'
alias acpi='cat /sys/class/power_supply/BAT0/capacity'

PS1="\[\e[35m\]\w\[\e[m\]\[\e[35m\] >\[\e[m\] "
PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"
export _JAVA_AWT_WM_NONREPARENTING=1
export LC_ALL=en_US.UTF-8
