OS="$(uname)"

alias ..='cd ..'
alias ...='cd ../..'
alias l='ls -AF'
alias la='ls -aF'
alias ll='ls -lhF'
alias lt='ls -lhtF'

if [[ $OS == 'Linux' ]]; then
    alias e='vim'
    alias mvim='vim'
    alias ack='ack-grep'
elif [[ $OS == 'Darwin' ]]; then
    alias e='mvim'
fi
