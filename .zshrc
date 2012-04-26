PS1='%n@%m:%~/> '


# Enviornment variables
################################
export EDITOR='vim'
export PAGER='less'
export PSQL_EDITOR='vim +"set syntax=sql" '
export PYTHONSTARTUP=$HOME/.python/startup.py

typeset -U path cdpath fpath manpath

if [[ "$OSTYPE" == darwin* ]]; then
    path=(/usr/local/bin /usr/local/share/python $path)
    export CLICOLOR=1
fi

if [[ -d $HOME/bin ]]; then
    path=($HOME/bin $path)
fi

if [[ -d $HOME/dotfiles/.zsh/functions ]]; then
    fpath=($HOME/dotfiles/.zsh/functions $fpath)
fi

autoload -U zargs chkreboot extract

if [[ -x /usr/bin/dircolors ]]; then
    eval `dircolors`
fi


# Options
################################
setopt noclobber
setopt shortloops
setopt extendedglob
setopt nomatch
setopt badpattern
setopt list_types
setopt multios
setopt autocd
setopt autopushd
setopt pushdignoredups
setopt pushdsilent
setopt pushdtohome
setopt correct
setopt notify
setopt nobeep

watch=all
logcheck=60
WATCHFMT="%n from %M has %a tty%l at %T %W"


# Key (re-)binding
################################
bindkey -e

# bindkey "^[[A" history-beginning-search-backward  # up arrow
# bindkey "^[[B" history-beginning-search-forward   # down arrow

if [[ "$OSTYPE" == darwin* ]]; then
    bindkey "^[[H" beginning-of-line
    bindkey "^[[F" end-of-line
fi


# History
################################
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt append_history
setopt inc_append_history
setopt extended_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_expire_dups_first
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_no_store
setopt hist_verify
setopt hist_allow_clobber


# Completion
################################
autoload -Uz compinit
compinit
zmodload -i zsh/complist

unsetopt menu_complete
unsetopt flow_control
setopt auto_menu
setopt complete_in_word
setopt always_to_end

WORDCHARS=''

source ~/dotfiles/.zsh/completion.zsh


# Aliases
################################
source ~/dotfiles/.zsh/aliases.zsh
