```swift
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
print(fib(SwiftBigInteger(int: 100000)))
```
Install:

1. Copy SwiftBigInt/LibTomMath into your project (be sure to add it to your targets)
2. Copy SwiftBigInt/SwiftBigInteger and/or SwiftBigDecimal into your project (be sure to add it your targets)
3. Create a bridging header and add these lines to it. (Or add them to an existing header)

```c
#import "tommath.h"
```
