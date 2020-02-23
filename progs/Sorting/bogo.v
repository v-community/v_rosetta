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

fn is_sorted(arr []int) bool {
	for i := 0; i < arr.len - 1; i++ {
		if arr[i] > arr[i + 1] {
			return false
		}
	}
	return true
}

fn main() {
	rand.seed(100)
	arr := [6, 9, 1, 4]
	println('Input: $arr')
	for !is_sorted(arr) {
		shuffle(mut arr)
	}
	println('Output: $arr')
}
