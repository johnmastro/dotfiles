###############################################################################
# ~/.zshenv: executed by zsh for all shells.
###############################################################################

if [[ -f ~/.envrc ]]; then
    source ~/.envrc
fi

typeset -U path cdpath fpath manpath

