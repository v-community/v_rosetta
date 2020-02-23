const (
        MAX = 10
)

fn factorial_i() {
        mut facs := [0].repeat(MAX + 1)
        facs[0] = 1
        println('The 0-th Factorial number is: 1')
        for i := 1; i <= MAX; i++ {
                facs[i] = i * facs[i - 1]
                num := facs[i]
                println('The $i-th Factorial number is: $num')
        }
}

fn factorial_r(n int) int {
        if n == 0 {
                return 1
        }
        return n * factorial_r(n - 1)
}

fn main() {
        factorial_i()
        for i := 0; i <= MAX; i++ {
                println('factorial($i) is: ${factorial_r(i)}')
        }
}
