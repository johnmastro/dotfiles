###############################################################################
# ~/.zshrc: executed by zsh for interactive shells.
###############################################################################

# Enviornment variables --------------------------------------------------- {{{

PS1='%n@%m:%~/> '
export EDITOR='vim'
export PAGER='less'
export LESS='-iMRSx4 -FX'
export PSQL_EDITOR='vim +"set syntax=sql" '
export PYTHONSTARTUP="$HOME/.python/startup.py"

typeset -U path cdpath fpath manpath

if [[ "$OSTYPE" == darwin* ]]; then
    path=(/usr/local/bin /usr/local/share/python $path)
    export CLICOLOR=1
fi

if [[ -d ~/bin ]]; then
    path=($HOME/bin $path)
fi

autoload -U zargs

if [[ -x /usr/bin/dircolors ]]; then
    if [[ -f ~/.dircolors ]]; then
        eval `dircolors -b ~/.dircolors`
    else
        eval `dircolors -b`
    fi
fi

# }}}
# Options ----------------------------------------------------------------- {{{

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

# }}}
# Key (re-)binding -------------------------------------------------------- {{{

bindkey -e

if [[ "$OSTYPE" == darwin* ]]; then
    bindkey "^[[H" beginning-of-line
    bindkey "^[[F" end-of-line
fi

# }}}
# History ----------------------------------------------------------------- {{{

HISTFILE=$HOME/.histfile
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

# }}}
# Aliases ----------------------------------------------------------------- {{{

[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.private/.aliases ]] && source ~/.private/.aliases

alias pyfind='for py (**/*.py) echo $py'
alias pyclean='zargs **/*.py[co] -- rm'

# global aliases
alias -g L='| less'
alias -g G='| grep'
alias -g E='| grep -E'
alias -g V='| col -b | vim -R -'

# suffix (extension) aliases
alias -s txt='vim'
alias -s ini='vim'
alias -s conf='vim'
alias -s rst='vim'
alias -s md='vim'

# }}}
# Completion -------------------------------------------------------------- {{{

autoload -Uz compinit
compinit
zmodload -i zsh/complist

unsetopt menu_complete
unsetopt flow_control
setopt auto_menu
setopt complete_in_word
setopt always_to_end

WORDCHARS=''

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

if [[ "$OSTYPE" == linux* ]]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
else
    zstyle ':completion:*' list-colors ''
fi

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
cdpath=(.)

# }}}

# vim: foldmethod=marker:foldlevel=0
