proc abbreviate {phrase} {
    set sub [string map {"-" " "} $phrase]
    regsub -all {[[:punct:]]+} $sub "" sub
    set res ""
    foreach word $sub {
        append res "[string toupper [string index $word 0]]"
    }
    return $res
}
