# laziness
alias e='vim'
alias vi='vim'
alias g='git'
alias x='extract'
alias _='sudo'
alias ipy='ipython'

# linux-specific aliases
if [[ "$OSTYPE" == linux* ]]; then
    alias mvim='vim'
    alias ctl='sudo service'
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias apt='sudo aptitude'
    alias rpt='psql reporting'
fi

# ls
alias l='ls'
alias la='ls -AF'
alias ll='ls -lhF'
alias lt='ls -lhtF'
alias ltr='ls -lhtrF'

# file & directory operations
alias ...='cd ../..'
alias cp='cp -i'
alias mv='mv -i'
alias md='mkdir -p'
alias d='dirs -v'
alias df='df -h'
alias 1='cd -'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'

# archives
alias tgc='tar -cxvf'
alias tgx='tar -zxvf'
alias tbc='tar --bzip2 -cvf'
alias tbx='tar --bzip2 -xvf'

# history
alias history='fc -l 1'
alias h='history'

# exclude these from globbing/correction
alias find='noglob find'
# alias cp='nocorrect cp'
# alias mv='nocorrect mv'
# alias mkdir='nocorrect mkdir'
# alias man='nocorrect man'
# alias psql='nocorrect psql'
# alias pip='nocorrect pip'
# alias cpanm='nocorrect cpanm'

# python stuff (inspired by oh-my-zsh's python plugin)
alias pyfind='for py (**/*.py) echo $py'
alias pyclean='zargs **/*.py[co] -- rm'

# global aliases
alias -g L='| less'
alias -g G='| grep'
alias -g E='| egrep'
alias -g V='| col -b | vim -R -'

# suffix (extension) aliases
alias -s txt='vim'
alias -s ini='vim'
alias -s conf='vim'
