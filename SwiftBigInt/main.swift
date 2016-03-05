func fib(n: SwiftBigInteger) -> SwiftBigInteger {
    if n < 2 {
        return n
    }
    
    var fibPrev = SwiftBigInteger(int: 1)
    var fib = SwiftBigInteger(int: 1)
    var num = SwiftBigInteger(int: 2)
    
    repeat {
        (fibPrev, fib) = (fib, fib + fibPrev)
        num += 1
    } while num < n
    
    return fib
}

print("Running")
print(String(fib(SwiftBigInteger(int: 10000))).characters.count)

let a = SwiftBigInteger(string: "12")
let b = SwiftBigInteger(string: "12")
print(a / 14)
print(a + b)