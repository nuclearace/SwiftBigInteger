```swift
import SwiftBigInt

func fib(n: BigInteger) -> BigInteger {
    if n < 2 {
        return n
    }

    var fibPrev = BigInteger(int: 1)
    var fib = BigInteger(int: 1)
    var num = BigInteger(int: 2)

    repeat {
        (fibPrev, fib) = (fib, fib + fibPrev)
        num += 1
    } while num < n

    return fib
}

print(fib(BigInteger(int: 100000)))
```
Install:

- Install libtommath to /usr/local/
- Add `.Package("https://github.com/nuclearace/SwiftBigInteger", majorVersion: 1)` as a dependency.
- Add `-Xlinker -L/usr/local/lib -Xcc -I/usr/local/include` to your build command.
