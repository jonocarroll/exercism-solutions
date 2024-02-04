proc verse {n} {
    array set days {
        1 first
        2 second
        3 third
        4 fourth
        5 fifth
        6 sixth
        7 seventh
        8 eighth
        9 ninth
        10 tenth
        11 eleventh
        12 twelfth
    }
    array set gifts {
        1 "a Partridge in a Pear Tree"
        2 "two Turtle Doves"
        3 "three French Hens"
        4 "four Calling Birds"
        5 "five Gold Rings"
        6 "six Geese-a-Laying"
        7 "seven Swans-a-Swimming"
        8 "eight Maids-a-Milking"
        9 "nine Ladies Dancing"
        10 "ten Lords-a-Leaping"
        11 "eleven Pipers Piping"
        12 "twelve Drummers Drumming"
    }
    set verse "On the $days($n) day of Christmas my true love gave to me: "
    set i $n
    while {$i > 1} {
        append verse "$gifts($i), "
        incr i -1
    }
    if {$n > 1} {
        append verse "and $gifts(1)."
    } else {
        append verse "$gifts(1)."
    }
    return $verse
}

proc sing {from to} {
    set res ""
    for {set i $from} {$i <= $to} {incr i} {
        append res "[verse $i]"
        if {$i != $to} {
            append res "\n"
        }
    }
    return $res
}
