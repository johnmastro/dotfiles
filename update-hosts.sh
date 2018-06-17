#!/usr/bin/env bash

# Update /etc/hosts with the file from https://github.com/StevenBlack/hosts

set -e

if [[ $(id -u) -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi

file="https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
date=$(date +'%Y%m%d%H%M%S')

cp /etc/hosts "/etc/hosts.${date}.bak"
curl "${file}" | sudo tee /etc/hosts
