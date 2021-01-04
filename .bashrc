alias ..='cd ..'
alias ls='ls -aCF --color=auto'
alias rm='rm -r'
alias mkdir='mkdir -pv'
alias free='free -mt'
alias acpi='cat /sys/class/power_supply/BAT0/capacity'

PS1="\[\e[35m\]\w\[\e[m\]\[\e[35m\] >\[\e[m\] "
PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"
export LC_ALL=en_US.UTF-8
export HISTFILE=/home/user/.cache/bash_history
