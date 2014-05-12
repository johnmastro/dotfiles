#!/usr/bin/env bash

shopt -s extglob dotglob nullglob

repo="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mklink () {
    local src="$1"
    local dst="$2"

    if [ -L "$dst" ]; then
        rm "$dst"
    elif [ -e "$dst" ]; then
        mv -f "$dst" "$dst.bak"
    fi

    ln -s "$src" "$dst"
}

mkdir -p $HOME/{code,src,bin}

dotfiles=($repo/!(install.sh|bin|.git|.gitignore))

for fn in "${dotfiles[@]}"; do
    bn="$(basename "$fn")"
    mklink "$fn" "$HOME/$bn"
done

scripts=($repo/bin/*)

for fn in "${scripts[@]}"; do
    bn="$(basename "$fn")"
    mklink "$fn" "$HOME/bin/$bn"
done
