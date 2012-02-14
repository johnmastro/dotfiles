# function from oh-my-zsh's git plugin:
function current_branch() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo ${ref#refs/heads/}
}

alias gpull='git pull origin $(current_branch)'
alias gpush='git push origin $(current_branch)'
