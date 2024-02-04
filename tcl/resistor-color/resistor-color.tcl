namespace eval resistorColor {
    proc colorCode {args} {
        array set cols {
            black 0
            white 9
            orange 3
            brown 1
            red 2
            yellow 4
            green 5
            blue 6
            violet 7
            grey 8
        }

        if { $args in [array names cols] } {
            return [set cols($args)]
        } else {
            error "Invalid color: $args"
        }
    }
 
   proc colors {args} {
        set cols {black brown red orange yellow green blue violet grey white}
        if { [llength $args] eq 0 } {
            return $cols
        } else {
            return [set cols($args)]
        }
    }
}
