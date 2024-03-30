#!/usr/bin/env bash

main() {
    limit="$1"

    [ "$limit" = 1 ] && echo ""

    s=()
    s[0]=false
    s[1]=false

    for ((i=2; i<=$limit; i++))
    do
        s[$i]=true
    done

    for ((i=2; i<=$limit; i++))
    do
        ([ ! "${s[$i]}" ] || [ $((2*i)) -gt $limit ]) && continue
        for j in $(seq $((2*i)) $i $limit)
        do
            s[$j]=false
        done
    done

    primes=()
    for ((i=2; i<=$limit; i++))
    do
        if [ ${s[$i]} = true ]; then
            primes+=($i)
        fi
    done

    echo "${primes[@]}"
}

main "$@"
