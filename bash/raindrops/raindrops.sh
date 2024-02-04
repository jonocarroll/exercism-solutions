#!/usr/bin/env bash

main () {
    res=""
    if ! (( $1 % 3 ))
    then
       res="${res}Pling"
    fi
    if ! (( $1 % 5 ))
    then
       res="${res}Plang"
    fi
    if ! (( $1 % 7 ))
    then
       res="${res}Plong"
    fi
    if [[ -z "$res" ]]
    then
        res="$1"
    fi
    echo $res
}

main "$@"
