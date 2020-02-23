import (
	rand
)

fn shuffle(arr mut []int) {
	for i := arr.len - 1; i >= 0; i-- {
		j := rand.next(i + 1)
		temp := arr[i]
		arr[i] = arr[j]
		arr[j] = temp
	}
	println('After Shuffle: ' + arr.str())
}

fn main() {
	rand.seed(100)
	mut arr := [6, 9, 1, 4]
	println('Input: $arr')
	shuffle(mut arr)
	shuffle(mut arr)
	println('Output: $arr')
}
