#!/usr/bin/env bash

if [ ! -d ~/dotfiles ]; then
    echo "~/dotfiles not found; exiting"
    exit 1
fi

mklink() {
    # create a symbolic link. if there's already a link at the given
    # destination, delete it. if there's a file there, move it (to
    # $file.bak).
    if [ -e $1 ]; then
        if [ -e $2 ]; then
            if [ -L $2 ]; then
                rm $2
            else
                local dst="$2.bak"
                mv $2 $dst
            fi
        fi
        ln -s $1 $2
    fi
}

mklink ~/dotfiles/.zshrc ~/.zshrc
mklink ~/dotfiles/.vimrc ~/.vimrc
mklink ~/dotfiles/.gitconfig ~/.gitconfig
mklink ~/dotfiles/.inputrc ~/.inputrc
mklink ~/dotfiles/.pylintrc ~/.pylintrc
mklink ~/dotfiles/.psqlrc ~/.psqlrc
mklink ~/dotfiles/.tmux.conf ~/.tmux.conf

mkdir -p ~/.tmp/vim/{backup,undo,swap}
