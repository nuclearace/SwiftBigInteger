func fib(_ n: SwiftBigInteger) -> SwiftBigInteger {
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
print(String(describing: fib(SwiftBigInteger(int: 100000))).characters.count)

let a = SwiftBigInteger(string: "23897834507380427589472895074982758924375827430572348578290475827409") + SwiftBigInteger(string: "2389783450738042789472895074982758924375827430572348578290475827409")
let b = a.pow(100000)

print("done")
