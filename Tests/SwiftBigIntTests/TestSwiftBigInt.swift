//
// Created by Erik Little on 5/29/17.
//

import Foundation
@testable import SwiftBigInt
import XCTest

class TestSwiftBigInteger : XCTestCase {
    func testFib() {
        XCTAssertEqual("2662710205480735617346452022100755074809023407208374441801919604845563638678145849451440",
                       fib(SwiftBigInteger(int: 420)).stringValue, "It should correctly represent the 420th fib number")
    }
}

class TestSwiftBigDecimal : XCTestCase {
    func testπ() {
        XCTAssertEqual(String(Double.pi), SwiftBigDecimal(double: Double.pi).stringValue)
    }
}

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
