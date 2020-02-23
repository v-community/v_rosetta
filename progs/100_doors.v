const (
	NbrDoors = 100
)

fn main() {
	mut closed_doors := [true].repeat(NbrDoors)
	for pass := 0; pass < NbrDoors; pass++ {
		for door := 0; door < NbrDoors; door += pass + 1 {
			closed_doors[door] = !closed_doors[door]
		}
	}
	for pass := 0; pass < NbrDoors; pass++ {
		println('Door # $pass: ' + if closed_doors[pass] { 'Closed' } else { 'Open' })
	}
}
