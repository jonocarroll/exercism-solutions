module RomanNumerals

let one scale =
    match scale with
    | 0 -> ""
    | 1 -> "I"
    | 2 -> "X"
    | 3 -> "C"
    | 4 -> "M"
    | _ -> ""

let five scale =
    match scale with
    | 0 -> ""
    | 1 -> "V"
    | 2 -> "L"
    | 3 -> "D"
    | _ -> ""

let translate digit n =
    match digit with
    | 1 -> one n
    | 2 -> String.replicate 2 (one n)
    | 3 -> String.replicate 3 (one n)
    | 4 -> (one n) + (five n)
    | 5 -> five n
    | 6 -> (five n) + (one n)
    | 7 -> (five n) + String.replicate 2 (one n)
    | 8 -> (five n) + String.replicate 3 (one n)
    | 9 -> (one n) + (one (n + 1))
    | _ -> ""

let rec roman arabicNumeral =
    let ns = (sprintf "%i" arabicNumeral)

    match ns.Length with
    | 1 -> translate arabicNumeral 1
    | n ->
        (translate (ns[0] |> System.Char.GetNumericValue |> int) n)
        + (roman (int ns[1..n]))
