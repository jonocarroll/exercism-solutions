#!/usr/bin/env bash

main () {
    res="false"
    for char in {a..z}
    do
        if ! grep -qi "$char" <<< "$1"; then
            echo "$res"
            exit
        fi
    done
    res="true"
    echo "$res"
}

main "$@"
