#!/usr/bin/env bash
#Source: https://gist.github.com/x-yuri/da5de61959ae118900b685fed78feff1
#Author: https://gist.github.com/x-yuri

set -eu
declare -A chains=(
    [filter]=INPUT:FORWARD:OUTPUT
    [raw]=PREROUTING:OUTPUT
    [mangle]=PREROUTING:INPUT:FORWARD:OUTPUT:POSTROUTING
    [security]=INPUT:FORWARD:OUTPUT
    [nat]=PREROUTING:INPUT:OUTPUT:POSTROUTING
)
for table in "${!chains[@]}"; do
    echo "${chains[$table]}" | tr : $"\n" | while IFS= read -r; do
        iptables -t "$table" -P "$REPLY" ACCEPT
    done
    iptables -t "$table" -F
    iptables -t "$table" -X
done
