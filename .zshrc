###############################################################################
# ~/.zshrc: executed by zsh for interactive shells.
###############################################################################

# Options ---------------------------------------------------------------------

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
setopt prompt_subst

autoload -Uz zargs

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '%F{green}%s:%b%f'
zstyle ':vcs_info:*' actionformats '%F{green}%s:%F{yellow}[%b|%a]%f'
precmd() { vcs_info }

PROMPT=$'
%F{blue}%n@%m:%~/%f ${vcs_info_msg_0_}
%B➜%b '

watch=all
logcheck=60
WATCHFMT="%n from %M has %a tty%l at %T %W"

if [[ -x /usr/bin/dircolors ]]; then
    if [[ -f ~/.dircolors ]]; then
        eval `dircolors -b ~/.dircolors`
    else
        eval `dircolors -b`
    fi
fi

# Key (re-)binding ------------------------------------------------------------

bindkey -e

# Use the Emacs/Bash definition of "word" characters (alphanumerics)
autoload -Uz select-word-style
select-word-style bash

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

if [[ "$OSTYPE" == darwin* ]]; then
    bindkey "^[[H" beginning-of-line
    bindkey "^[[F" end-of-line
fi

# History ---------------------------------------------------------------------

HISTFILE=$HOME/.histfile
HISTSIZE=5000
SAVEHIST=5000

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

# Aliases ---------------------------------------------------------------------

[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.private/.aliases ]] && source ~/.private/.aliases

alias pyfind='for py (**/*.py) echo $py'
alias pyclean='zargs **/*.py[co] -- rm'

# global aliases
alias -g L='| less'
alias -g G='| grep'
alias -g V='| col -b | vim -R -'

# suffix (extension) aliases
alias -s txt=$EDITOR
alias -s ini=$EDITOR
alias -s conf=$EDITOR
alias -s rst=$EDITOR
alias -s md=$EDITOR

# Completion ------------------------------------------------------------------

autoload -Uz compinit
compinit

autoload -Uz bashcompinit
bashcompinit

zmodload -i zsh/complist

unsetopt menu_complete
unsetopt flow_control
setopt auto_menu
setopt complete_in_word
setopt always_to_end

if command -v stack &>/dev/null; then
    eval "$(stack --bash-completion-script stack)"
fi

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
