#!/usr/bin/env zsh

_abbreviated_pwd() {
    local pwd="${PWD/#$HOME/~}"

    if [[ "${#pwd}" -gt 50 ]]; then
        local parts=(${(s:/:)pwd})

        if [[ "${#parts}" -gt 3 ]]; then
            local top
            local first
            local last

            if [[ "${parts[1]}" == '~' ]]; then
                top="~"
                first="${parts[2]}"
            else
                top=""
                first="${parts[1]}"
            fi

            last="${parts[-1]}"

            pwd="${top}/${first}/…/${last}"

            if [[ "${#pwd}" -gt 50 ]]; then
                pwd="${top}/…/${last}"
            fi
        fi
    fi

    _ABBREVIATED_PWD="${pwd}"
}

