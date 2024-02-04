#!/usr/bin/env bash

main () {
    if [[ -z "$1" ]]; then
        echo ""
        exit 0
    fi

    chars="$1"
    res=""

    for (( i=${#chars}; i >= 1; i-- )); do
        res+="${chars:$i-1:1}"
    done
    echo "$res"
}

main "$@"
