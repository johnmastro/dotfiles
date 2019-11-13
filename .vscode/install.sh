#!/usr/bin/env bash

shopt -s extglob dotglob nullglob

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link_config_files () {
    local config_files=($here/*.json)
    local destination="${HOME}/Library/Application Support/Code/User"

    local file
    local name
    if [[ -d "$destination" ]]; then
        for file in "${config_files[@]}"; do
            local name="$(basename "$file")"
            ln -s "$file" "${destination}/${name}"
        done
    else
        echo "Directory ${destination} does not exist"
        exit 1
    fi
}

install_extensions () {
    local extensions_file="${here}/extensions.txt"

    local extension
    if [[ -x "$(which code)" ]]; then
        while read extension; do
            code --install-extension "$extension"
        done < "$extensions_file"
    else
        echo "Code command not installed"
        exit 1
    fi
}

link_config_files
install_extensions
