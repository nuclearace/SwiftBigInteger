```swift
func fib(n: SwiftBigInteger) -> SwiftBigInteger {
    if n < 2 {
        return n
    }

    var fibPrev = SwiftBigInteger(int: 1)
    var fib = SwiftBigInteger(int: 1)

    repeat {
        (fibPrev, fib) = (fib, fib + fibPrev)
        num += 1
    } while num < n

    return fib
}

print("Running")
print(fib(SwiftBigInteger(int: 100000)))
```
Install:

- Add `.Package("https://github.com/nuclearace/SwiftBigInteger", majorVersion: 1)` as a dependency.
- Add `-Xlinker -L/usr/local/lib -Xcc -I/usr/local/include` to your build command.
