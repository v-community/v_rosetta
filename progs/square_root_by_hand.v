import math
import math.big
import strings

fn sqrt(n f64, limit int) string {
	one := big.from_int(1)
	ten := big.from_int(10)
	twenty := big.from_int(20)
	hundred := big.from_int(100)

	mut n0 := n
	if n0 < 0.0 {
		panic('Number cannot be negative')
	}
	mut count := 0
	for n0 != math.trunc(n0) {
		n0 *= 100
		count--
	}
	mut i := big.from_int(int(n0))
	mut j := i.isqrt()
	count += j.str().len
	mut k := j.clone()
	mut d := j.clone()
	mut digits := 0
	mut sb := ''
	for digits < limit {
		sb += d.str()
		i = (i - k * d) * hundred
		k = j * twenty
		d = one
		for big.cmp(d, ten) <= 0 {
			if big.cmp((k + d) * d, i) > 0 {
				d.dec()
				break
			}
			d.inc()
		}
		j = j * ten + d
		k = k + d
		digits++
	}

	mut root := sb.trim_right('0')
	if root.len == 0 {
		root = '0'
	}
	if count > 0 {
		root = root[0..count] + '.' + root[count..]
	} else if count == 0 {
		root = '0.' + root
	} else {
		root = '0.' + strings.repeat(`0`, -count) + root
	}
	root = root.trim_suffix('.')
	if root.len > limit && root.contains('.') {
		l := root.after_char(`.`)
		if l.len > limit {
			root = root[0..(root.len - (l.len - limit))]
		}
	}
	return root
}

fn main() {
	numbers := [f64(2), 0.2, 10.89, 625, 0.0001]
	digits := [500, 80, 8, 8, 8]
	for i, n in numbers {
		println('First ${digits[i]} significant digits (at most) of the square root of $n:')
		println(sqrt(n, digits[i]))
	}
}
