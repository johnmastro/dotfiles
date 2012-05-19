###############################################################################
# ~/.bashrc
#
# executed by bash for interactive shells. based on the default version
# shipped with ubuntu.
###############################################################################

# if not running interactively, don't do anything
[ -z "$PS1" ] && return

# enviornment variables
export EDITOR='vim'
export PAGER='less'
export PSQL_EDITOR='vim +"set syntax=sql" '
export PYTHONSTARTUP="$HOME/.python/startup.py"

# options specific to os x
if [[ "$OSTYPE" =~ "darwin" ]]; then
    [ -d /usr/local/bin ] && PATH="/usr/local/bin:$PATH"
    [ -d /usr/local/share/python ] && PATH="/usr/local/share/python:$PATH"

    export CLICOLOR=1

    type -P brew &>/dev/null
    if [[ "$?" == "0" ]]; then
        brew_prefix="$(brew --prefix)"
        if [ -f $brew_prefix/etc/bash_completion ]; then
            source $brew_prefix/etc/bash_completion
        fi
    fi
fi

# if it exists, add ~/bin to $PATH
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# history options
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

# Adjust the window size
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# aliases used in both bash in zsh
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# bash-specific aliases
alias cd='pushd'
alias ..='cd ..'
alias ...='cd ../..'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
