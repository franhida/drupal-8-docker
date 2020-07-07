export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -lah'
alias l='ls $LS_OPTIONS -lA'
alias la='ll -a'

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi