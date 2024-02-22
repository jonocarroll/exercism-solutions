module ProteinTranslation

let prots codon =
    match codon with
    | "UAA" -> "STOP"
    | "UAG" -> "STOP"
    | "UGA" -> "STOP"
    | "AUG" -> "Methionine"
    | "UUU" -> "Phenylalanine"
    | "UUC" -> "Phenylalanine"
    | "UUA" -> "Leucine"
    | "UUG" -> "Leucine"
    | "UCU" -> "Serine"
    | "UCC" -> "Serine"
    | "UCA" -> "Serine"
    | "UCG" -> "Serine"
    | "UAU" -> "Tyrosine"
    | "UAC" -> "Tyrosine"
    | "UGU" -> "Cysteine"
    | "UGC" -> "Cysteine"
    | "UGG" -> "Tryptophan"
    | _ -> ""

let rec proteins rna =
    match rna with
    | "" -> []
    | xs ->
        match (prots xs[0..2]) with
        | "STOP" -> []
        | "" -> []
        | ys -> ys :: proteins (xs[3 .. xs.Length])
