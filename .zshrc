PS1='%n@%m:%~/> '
#PS1='%n@%m:%~%# '
#RPS1='%~/'


# Enviornment variables
################################
export EDITOR='vim'
export PAGER='less'
export PSQL_EDITOR='vim +"set syntax=sql" '

typeset -U path cdpath fpath manpath

if [[ "$OSTYPE" == darwin* ]]; then
    path=(/usr/local/bin /usr/local/share/python $path)
    export CLICOLOR=1
fi

if [[ -d ${HOME}/bin ]]; then
    path=(${HOME}/bin $path)
fi

fpath=(${HOME}/dotfiles/.zsh/functions $fpath)
autoload -U chkreboot extract

if [[ -x /usr/bin/dircolors ]]; then
    eval `dircolors`
fi


# Load the completion modules
################################
autoload -Uz compinit
compinit
zmodload -i zsh/complist


# Source additional config files
################################
for config_file (${HOME}/dotfiles/.zsh/*.zsh) source $config_file
