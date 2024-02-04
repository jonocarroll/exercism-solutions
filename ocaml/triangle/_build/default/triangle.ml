let triangle a b c =
(a + b >= c) && (b + c >= a) && (a + c >= b)

let nonzero a b c =
(triangle a b c) && a > 0 && b > 0 && c > 0

let is_equilateral a b c =
(nonzero a b c) && a = b && a = c && a > 0

let is_isosceles a b c =
if not (nonzero a b c ) then
false else if
(a = b) then true else if
(b = c) then true else if
(a = c) then true else false;;


let is_scalene a b c =
(nonzero a b c) && a != c && a != b && b != c
