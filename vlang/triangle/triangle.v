module main

fn is_triangle(a f64, b f64, c f64) bool {
	basecond := a > 0 && b > 0 && c > 0
	cond1 := a + b >= c
	cond2 := b + c >= a
	cond3 := a + c >= b
	return basecond && cond1 && cond2 && cond3 
}

fn is_isosceles(a f64, b f64, c f64) bool {
	return is_triangle(a, b, c) &&
		(a == b || a == c || b == c)
}

fn is_equilateral(a f64, b f64, c f64) bool {
	return is_triangle(a, b, c) && (a == b && b == c)
}

fn is_scalene(a f64, b f64, c f64) bool {
	return is_triangle(a, b, c) && (a != b && b != c && a != c)
}
