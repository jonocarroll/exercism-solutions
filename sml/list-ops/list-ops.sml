fun concat (lists: int list list): int list =
    foldr op@ [] lists

fun reverse (list: int list): int list =
    foldl op:: [] list

fun filter (function: int -> bool, list: int list): int list =
    let
        fun filter' _ [] = []
          | filter' f (x::xs) = if f(x) then x::(filter' f xs) else filter' f xs
    in
        filter' function list
    end

fun map (function: int -> int, list: int list): int list =
    let
        fun map' _ [] = []
          | map' f (x::xs) = f(x) :: map' f xs
    in
        map' function list
    end

fun append (list1: int list, list2: int list): int list = list1 @ list2

fun length (ns: int list): int =
    let
        fun length' [] = 0
          | length' (x::xs) = 1 + length'(xs)
    in
        length' ns
    end

fun foldl (function: int * int -> int, initial: int, list: int list): int =
    let
        fun foldl' _ z [] = z
          | foldl' f z (x::xs) = foldl' f (f (z, x)) xs

    in
        foldl' function initial list
    end

fun foldr (function: int * int -> int, initial: int, list: int list): int =
    let
        fun foldr' f z [] = z
          | foldr' f z (x::xs) = f (x, foldr' f z xs)
    in
        foldr' function initial list
    end
