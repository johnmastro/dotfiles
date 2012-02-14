bindkey -e

bindkey -M menuselect '^o' accept-and-infer-next-history

if [[ "$OSTYPE" == darwin* ]]; then
    bindkey "^[[H" beginning-of-line
    bindkey "^[[F" end-of-line
fi
