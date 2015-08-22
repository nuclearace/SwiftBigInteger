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
print(fib(SwiftBigInteger(int: 100000)).stringValue.characters.count)