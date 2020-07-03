export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -lah'
alias l='ls $LS_OPTIONS -lA'
alias la='ll -a'

# Git aliases
alias gs='git status'
alias glog='git log -n 3'
alias ga='git add'

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi