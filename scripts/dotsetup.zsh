#!/usr/bin/env zsh

# dotsetup.zsh
# ------------
# creates symbolic links into my dotfiles repo and folders for vim's tmp files.

if [[ ! -d ~/dotfiles ]]; then
    echo "~/dotfiles not found; exiting."
    exit 1
fi

function mklink() {
    # create a symbolic link. if there's already a link at the given
    # destination, delete it. if there's a file there, move it (to
    # $file.bak).
    if [[ -e $1 ]]; then
        if [[ -e $2 ]]; then
            if [[ -L $2 ]]; then
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
mklink ~/dotfiles/.tmux.conf ~/.tmux.conf

if [[ ! -d ~/.vim/tmp ]]; then mkdir -p ~/.vim/tmp; fi
if [[ ! -d ~/.vim/tmp/backup ]]; then mkdir ~/.vim/tmp/backup; fi
if [[ ! -d ~/.vim/tmp/undo ]]; then mkdir ~/.vim/tmp/undo; fi
if [[ ! -d ~/.vim/tmp/swap ]]; then mkdir ~/.vim/tmp/swap; fi
