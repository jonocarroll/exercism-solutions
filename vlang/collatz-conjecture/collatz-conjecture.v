module main

fn collatz(number int) !int {
	if number < 1 {
		return error('only positive input')
	}
	mut x := number
	mut i := 0
	for x != 1 {
		if x % 2 == 0 {
			x /= 2
		} else {
			x *= 3
			x += 1
		}
		i += 1
	}
	return i
}
