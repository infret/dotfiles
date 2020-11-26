# If not running interactively, don't do anything
[[ $- != *i* ]] && return

ALERT="${BWhite}${On_Red}" # Bold White on red background

# Useful aliases
alias ..='cd ..'
alias ls='ls -CF --color=auto'
alias mkdir='mkdir -pv'
alias free='free -mt'
alias myip='curl ipv4.icanhazip.com'
alias grep='grep --color=auto'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'

PS1="\[\e[35m\]\w\[\e[m\]\[\e[35m\] >\[\e[m\] "

# Set PATH so it includes user's private bin directories
PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"
