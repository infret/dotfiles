[[ $- != *i* ]] && return

alias ..='cd ..'
alias ls='ls -aCF --color=auto'
alias rm='rm -r'
alias mkdir='mkdir -pv'
alias free='free -mt'
alias myip='curl ipv4.icanhazip.com'
alias grep='grep --color=auto'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

PS1="\[\e[35m\]\w\[\e[m\]\[\e[35m\] >\[\e[m\] "
PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"
LC_ALL=en_US.UTF-8

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx /usr/bin/openbox-session
