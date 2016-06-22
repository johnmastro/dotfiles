#!/usr/bin/env bash

shopt -s extglob dotglob nullglob

repo="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mklink () {
    if [[ $# != 2 ]]; then
        echo "mklink: Wrong number of arguments"
        exit 1
    fi

    local src="$1"
    local dst="$2"
    local today=$(date +'%Y%m%d')

    if [[ -L $dst ]]; then
        rm "$dst"
    elif [[ -e $dst ]]; then
        mv -f "$dst" "$dst.bak.$today"
    fi

    ln -s "$src" "$dst"
}

link_dotfiles () {
    echo "Creating links to dotfiles"
    echo "--------------------------"
    local files=($repo/!(.|..|install.sh|bin|.git|.gitignore|.gitattributes*))

    local name
    local path
    for path in "${files[@]}"; do
        name="$(basename "$path")"
        echo "Install '"$name"'?"
        echo -n "> "
        read answer
        if [[ $answer =~ [yY] ]]; then
            mklink "$path" "$HOME/$name"
        fi
    done
}

link_bin () {
    echo "Creating links to executables"
    echo "-----------------------------"
    local scripts=($repo/bin/*)

    local name
    local path
    for path in "${scripts[@]}"; do
        name="$(basename "$path")"
        echo "Install '"$name"'?"
        echo -n "> "
        read answer
        if [[ $answer =~ [yY] ]]; then
            mklink "$path" "$HOME/bin/$name"
        fi
    done
}

make_dirs () {
    echo "Creating directories"
    echo "--------------------"

    local name
    local path
    for name in code src bin .maildir/fastmail; do
        path="$HOME/$name"
        echo "Create '"$path"'?"
        echo -n "> "
        read answer
        if [[ $answer =~ [yY] ]]; then
            mkdir -p "$path"
        fi
    done
}

run_all () {
    make_dirs
    link_dotfiles
    link_bin
}

run () {
    if [[ $# == 0 ]]; then
        echo "Usage: install.sh [bin|dirs|dotfiles|all]"
    fi
    for arg in "$@"; do
        case $arg in
            dirs) make_dirs;;
            dotfiles) link_dotfiles;;
            bin) link_bin;;
            all) run_all;;
            *) echo "Unknown arg '"$arg"'; ignoring";;
        esac
    done
}

run "$@"
