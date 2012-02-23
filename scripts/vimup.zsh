#!/usr/bin/env zsh

# vimup.zsh
# ---------
# updates my vim plugins for me.

if [[ ! -d ~/src/vim-plugins ]]; then
    echo "~/src/vim-plugins not found; exiting."
    exit 1
fi

function update_plugin () {
    if [[ -d $1 ]]; then
        local plugin="$(basename $1)"
        local dst="$HOME/dotfiles/.vim/bundle/$plugin"

        echo "Updating plugin $plugin"
        if [[ -d $1/.git ]]; then cd $1 && git pull; fi
        if [[ -d $dst ]]; then rm -rf $dst; fi
        cp -r $1 $dst
        if [[ -d $dst/.git ]]; then rm -rf $dst/.git; fi
        if [[ -e $dst/.gitignore ]]; then rm $dst/.gitignore; fi
    fi
}

for vim_plugin (~/src/vim-plugins/*) update_plugin $vim_plugin
echo "Done. Don't forget to run :Helptags."
