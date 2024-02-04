let alpha = ['a'; 'b'; 'c'; 'd'; 'e'; 'f';
'g'; 'h'; 'i'; 'j'; 'k'; 'l'; 'm'; 'n';
'o'; 'p'; 'q'; 'r'; 's'; 't'; 'u'; 'v';
'w'; 'x'; 'y'; 'z']

let is_pangram s =
let x = String.lowercase_ascii s in 
List.for_all(String.contains x) alpha



