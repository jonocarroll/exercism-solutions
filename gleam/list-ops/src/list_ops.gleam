pub fn append(first first: List(a), second second: List(a)) -> List(a) {
    case first {
        [] -> second
        [head, ..rest] -> [head, ..append(rest, second)]
    }
}

pub fn concat(lists: List(List(a))) -> List(a) {
    foldl(lists, [], append)
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
    case list {
         [] -> []
         [head, ..rest] -> {
                case function(head) {
                     True -> [head, ..filter(rest, function)]
                     _ -> filter(rest, function)
                }
         }
    }
}

pub fn length(list: List(a)) -> Int {
    case list {
        [] -> 0
        [_, ..rest] -> 1 + length(rest)
    }
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
    case list {
        [] -> []
        [head, ..rest] -> [function(head), ..map(rest, function)]
    }
}

pub fn foldl(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
    case list {
        [] -> initial
        [head, ..rest] -> foldl(rest, function(initial, head), function)
    }
}

pub fn foldr(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
    case list {
        [] -> initial
        [head, ..rest] -> function(foldr(rest, initial, function), head)
    }
}

pub fn reverse(list: List(a)) -> List(a) {
     case list {
        [] -> []
        [head, ..rest] -> append(reverse(rest), [head])
    }
}
