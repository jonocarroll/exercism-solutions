func foldLeft<T>(_ l:[T], accumulated i: T, combine f: ((T, T) -> T)) -> T {
    guard let head = l.first else { return i }
    return foldLeft(Array(l.dropFirst()), accumulated:f(i, head), combine:f)
}

func foldRight<T>(_ l: [T], accumulated i: T, combine f: ((T, T) -> T)) -> T {
    guard let head = l.first else { return i }
    return f(head, foldRight(Array(l.dropFirst()), accumulated:i, combine:f))
}

func map(_ l:[Int], _ f: ((Int) -> Int)) -> [Int] {
    guard let head = l.first else { return [] }
    return [f(head)] + map(Array(l.dropFirst()), f)
}

func concat(_ lists: [Int]...) -> [Int] {
    if length(lists[0]) == 0 {
        return []
    }
    var res = [Int]()
    for list in lists {
        res = res + list
    }
    return res
}

func append(_ l1: [Int], _ l2: [Int]) -> [Int] {
    return l1 + l2
}

func length(_ list: [Int]) -> Int {
    guard let _ = list.first else { return 0 }
    return 1 + length(Array(list.dropFirst()))
}

func filter(_ list: [Int], _ f: ((Int) -> Bool)) -> [Int] {
    guard let head = list.first else { return [] }
    if f(head) {
        return [head] + filter(Array(list.dropFirst()), f)
    } else {
        return filter(Array(list.dropFirst()), f)
    }
}

func reverse(_ list: [Int]) -> [Int] {
    guard let head = list.first else { return [] }
    return reverse(Array(list.dropFirst())) + [head]
}
