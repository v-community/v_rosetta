// http://rosettacode.org/wiki/Fibonacci_sequence


fn fibonacci(n int) int {
	if n == 0 || n == 1 {
		return n
	}
	if n > 1 {
		return fibonacci(n - 2) + fibonacci(n - 1)
	}
	else {
		return fibonacci(n + 2) - fibonacci(n + 1)
	}
}

// does not support negative numbers
fn fib_iter(i int) int {
	if i < 2 {
		return i
	}
	mut a := 0
	mut b := 1
	mut c := 0
	for n := i - 1; n > 0; n-- {
		a += b
		c = a
		a = b
		b = c
	}
	return b
}

fn main() {
	arr := [10, -5, 4, 3, -8]
	for val in arr {
		println('fibonacci(${val : 3d}) = ${fibonacci(val) : 3d}')
	}
}
