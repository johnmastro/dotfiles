#!/usr/bin/env bash

shopt -s extglob dotglob nullglob

if [[ "$1" == "--force" ]]; then
    # remove existing files/directories
    force_install="Y"
else
    # skip existing files/directories (symlinks are still removed)
    force_install="N"
fi

repo="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mklink () {
    local src="$1"
    local dst="$2"

    if [ -L "$dst" ]; then
        rm -f "$dst"
    elif [[ -f "$dst" || -d "$dst" ]]; then
        if [[ "$force_install" == "Y" ]]; then
            [ -d "$dst" ] && rm -rf "$dst"
            [ -f "$dst" ] && rm -f "$dst"
        else
            echo -e "\twarning: $dst exists; skipping"
            return
        fi
    fi
    ln -s "$src" "$dst"
}

dotfiles=($repo/!(install.sh|bin|.git|.gitignore))

for fn in "${dotfiles[@]}"
do
    bn="$(basename $fn)"
    link="$HOME/$bn"
    mklink $fn $link
done

scripts=($repo/bin/*)
mkdir -p $HOME/bin

for fn in "${scripts[@]}"
do
    bn="$(basename $fn)"
    link="$HOME/bin/$bn"
    mklink $fn $link
done

mkdir -p ~/.tmp/vim/{backup,undo,swap}
