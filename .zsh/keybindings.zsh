bindkey -e

bindkey -M menuselect '^o' accept-and-infer-next-history

# use the up/down keys to search command history
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

if [[ "$OSTYPE" == darwin* ]]; then
    bindkey "^[[H" beginning-of-line
    bindkey "^[[F" end-of-line
fi
