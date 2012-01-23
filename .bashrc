export EDITOR="$(which vim)"
export PSQL_EDITOR='vim +"set syntax=sql" '
export PATH="/usr/local/bin:/usr/local/share/python:$PATH:/Users/jbm/bin"
export CLICOLOR=1

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
