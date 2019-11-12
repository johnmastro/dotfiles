#!/usr/bin/env bash

shopt -s extglob dotglob nullglob

src="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dst="${HOME}/Library/Application Support/Code/User"

if [[ -d "$dst" ]]; then
    ln -s "${src}/settings.json" "${dst}/settings.json"
    ln -s "${src}/keybindings.json" "${dst}/keybindings.json"
else
    echo "Directory ${dst} does not exist"
    exit 1
fi
