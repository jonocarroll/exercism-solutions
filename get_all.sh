#!/bin/bash

TRACK=$1

set -euo pipefail

trackdir="$(exercism workspace)/$TRACK"

mkdir -p "$trackdir"

curl --silent --fail "https://exercism.org/tracks/$TRACK/exercises" |
    grep -Eo 'tracks/'"$TRACK"'/exercises/[^&]+' |
    cut -d/ -f4 |
    tee "$trackdir/exercise-order.txt" |
    while read ex; do if test -d "$trackdir/$ex"
    then echo "$ex already downloaded"
	  else (set -x && exercism download --track "$TRACK" --exercise "$ex")
    fi
    done
