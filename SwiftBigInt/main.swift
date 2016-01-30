func fib(n: SwiftBigInteger) -> SwiftBigInteger {
    if n < 2 {
        return n
    }
    
    var fibPrev = SwiftBigInteger(int: 1)
    var fib = SwiftBigInteger(int: 1)
    
    for var num = SwiftBigInteger(int: 2); num < n; ++num {
        (fibPrev, fib) = (fib, fib + fibPrev)
    }
    
    return fib
}

print("Running")
print(String(fib(SwiftBigInteger(int: 10000))).characters.count)

let a = SwiftBigDecimal(string: "12.24")
let b = SwiftBigDecimal(string: "1.2")
print(a / 1.2)