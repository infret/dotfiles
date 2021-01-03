alias ..='cd ..'
alias ls='ls -aCF --color=auto'
alias rm='rm -r'
alias mkdir='mkdir -pv'
alias free='free -mt'
alias myip='curl ipv4.icanhazip.com'
alias grep='grep --color=auto'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias acpi='cat /sys/class/power_supply/BAT0/capacity'

PS1="\[\e[35m\]\w\[\e[m\]\[\e[35m\] >\[\e[m\] "
PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"
export LC_ALL=C
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot=/home/user/.config/java
export HISTFILE=/home/user/.cache/bash_history
