pub fn verse(n: u32) -> String {
    let plural = match n {
        2 => "bottle",
        _ => "bottles",
    };

    match n {
        0 => format!("No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"),
        1 => format!("1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"),
        _ => format!("{0} bottles of beer on the wall, {0} bottles of beer.\nTake one down and pass it around, {1} {plural} of beer on the wall.\n", n, n-1)
    }

}

pub fn sing(start: u32, end: u32) -> String {
    let mut res = "".to_string();
    if start == 0 {
        return format!("{}", verse(0))
    }
    for i in (end..=start).rev() {
        if i == start {
            res = format!("{}{}", res, verse(i))
        } else {
            res = format!("{}\n{}", res, verse(i))
        }

    }
    res
}
