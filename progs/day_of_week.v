import time

fn main() {
	for y := 2008; y <= 2121; y++ {
		d := time.parse('${y}-12-25 00:00:00') or {
			continue
		}
		if d.day_of_week() == 7 {
			println('December 25 ${y} is a Sunday')
		}
	}
}
