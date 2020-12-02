alias ..='cd ..'
alias ls='ls -aCF --color=auto'
alias rm='rm -r'
alias mkdir='mkdir -pv'
alias free='free -mt'
alias myip='curl ipv4.icanhazip.com'
alias grep='grep --color=auto'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

set fish_greeting

function fish_prompt
    printf '%s%s%s%s > ' (set_color '#790079') (prompt_pwd)
end

if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx /usr/bin/openbox-session -- -keeptty
    end
end