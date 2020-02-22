import math 
const (
        SupportedOperations = ['+', '-', '*', '/', '^']
        MaxDepth = 256
)

struct Stack {
mut:
        data  []f32=[f32(0)].repeat(MaxDepth)
        depth int=0
}

fn (s mut Stack) push(v f32) {
        if s.depth >= MaxDepth {
                return
        }
        s.data[s.depth] = v
        s.depth++
}

fn (s mut Stack) pop() ?f32 {
        if s.depth > 0 {
                s.depth--
                result := s.data[s.depth]
                return result
        }
        return error('Stack Underflow!!')
}

fn (s Stack) peek() ?f32 {
        if s.depth > 0 {
                result := s.data[0]
                return result
        }
        return error('Out of Bounds...')
}

fn (s mut Stack) rpn(input string) ?f32 {
        println('Input: $input')
        tokens := input.split(' ')
        mut a := f32(0)
        mut b := f32(0)
        println('Token     Stack')
        for token in tokens {
                if token.str.is_digit() {
                        s.push(token.f32())
                }
                else if token in SupportedOperations {
                        b = s.pop() or {
                                f32(0)
                        }
                        a = s.pop() or {
                                f32(0)
                        }
                        match token {
                                '+' {
                                        s.push(a + b)
                                }
                                '-' {
                                        s.push(a - b)
                                }
                                '*' {
                                        s.push(a * b)
                                }
                                '/' {
                                        s.push(a / b)
                                }
                                '^' {
                                        s.push(math.pow(a,b))
                                }
                                else {
                                        println('Oofffff')
                                }
                        }
                }
                print('${token : 5s}     ')
                for i := 0; i < s.depth; i++{
                    if i == s.depth - 1 {
                        println('${s.data[i] : 0.6f} |>')
                    }
                    else {
                        print('${s.data[i] : 0.6f}, ')
                    }
                }
        }
        return s.peek()
}

fn main() {
        mut calc := Stack{}
        result := calc.rpn('3 4 2 * 1 5 - 2 3 ^ ^ / +') or {
                return
        }
        println('\nResult:   $result')
}