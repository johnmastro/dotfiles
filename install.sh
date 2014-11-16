#!/usr/bin/env bash

shopt -s extglob dotglob nullglob

repo="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mklink () {
    local src="$1"
    local dst="$2"
    local today=$(date +'%Y%m%d')

    if [[ -L "$dst" ]]; then
        rm "$dst"
    elif [[ -e "$dst" ]]; then
        mv -f "$dst" "$dst.bak.$today"
    fi

    ln -s "$src" "$dst"
}

link_dotfiles () {
    echo "Creating links to dotfiles"
    local dotfiles=($repo/!(install.sh|bin|.git|.gitignore))

    local fn
    local bn
    for fn in "${dotfiles[@]}"; do
        bn="$(basename "$fn")"
        mklink "$fn" "$HOME/$bn"
    done
}

link_bin () {
    echo "Creating links to executables"
    local scripts=($repo/bin/*)

    local fn
    local bn
    for fn in "${scripts[@]}"; do
        bn="$(basename "$fn")"
        mklink "$fn" "$HOME/bin/$bn"
    done

}

make_dirs () {
    echo "Creating directories"
    mkdir -p $HOME/{code,src,bin,.maildir/fastmail}
}

run () {
    if [[ $# == 0 ]]; then
        echo "Usage: install.sh [bin|dirs|dotfiles]"
    fi
    for arg in "$@"; do
        case $arg in
            dirs) make_dirs;;
            dotfiles) link_dotfiles;;
            bin) link_bin;;
            *) echo "Unknown arg '"$arg"'; ignoring";;
        esac
    done
}

run "$@"
