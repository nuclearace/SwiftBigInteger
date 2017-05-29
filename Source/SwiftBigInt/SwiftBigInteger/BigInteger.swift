//
//  SwiftBigInteger.swift
//  SwiftBigInt
//
//  Created by Erik Little on 7/1/15.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation
import LibTomMathSwift

public class BigInteger: CustomStringConvertible, Equatable, Comparable {
    fileprivate var internalInt: mp_int

    public var description: String {
        return stringValue
    }

    fileprivate var internalIntPointer: UnsafeMutablePointer<mp_int> {
        let pointer = UnsafeMutablePointer<mp_int>.allocate(capacity: 1)
        pointer.initialize(to: internalInt)

        return pointer
    }

    public var stringValue: String {
        var stringSize: Int32 = 0
        var stringArr: [Int8]
        let pointer = internalIntPointer

        mp_radix_size(pointer, 10, &stringSize)
        stringArr = [Int8](repeating: 0, count: Int(stringSize))
        mp_toradix(pointer, &stringArr, 10)

        pointer.deallocate(capacity: 1)

        return String(cString: &stringArr, encoding: .utf8)!
    }

    public init(string: String, withRadix radix: Int) {
        let pointer = UnsafeMutablePointer<mp_digit>.allocate(capacity: 1)
        internalInt = mp_int(used: 0, alloc: 0, sign: 0, dp: pointer)
        mp_init(&internalInt)
        mp_read_radix(&internalInt, string.cString(using: .utf8)!, Int32(radix))
    }

    public convenience init(string: String) {
        self.init(string: string, withRadix: 10)
    }

    public convenience init(int: Int) {
        self.init(string: String(int))
    }

    fileprivate init(mpInt: mp_int) {
        internalInt = mpInt
    }

    deinit {
        mp_clear(&internalInt)
    }
}

public extension BigInteger {
    public func compare(_ rhs: BigInteger) -> ComparisonResult {
        let comparisonResult = mp_cmp(rhs.internalIntPointer, internalIntPointer)

        switch comparisonResult {
        case MP_GT:
            return .orderedAscending
        case MP_EQ:
            return .orderedSame
        case MP_LT:
            return .orderedDescending
        default:
            fatalError()
        }
    }
}

public extension BigInteger {
    public func add(_ rhs: BigInteger) -> BigInteger {
        let p = UnsafeMutablePointer<mp_digit>.allocate(capacity: 1)
        let pointer = internalIntPointer
        let otherPointer = rhs.internalIntPointer
        var sum = mp_int(used: 0, alloc: 0, sign: 0, dp: p)

        mp_init(&sum)
        mp_add(pointer, otherPointer, &sum)

        pointer.deallocate(capacity: 1)
        otherPointer.deallocate(capacity: 1)

        return BigInteger(mpInt: sum)
    }

    public func divide(_ rhs: BigInteger) -> BigInteger {
        let p = UnsafeMutablePointer<mp_digit>.allocate(capacity: 1)
        let pointer = internalIntPointer
        let otherPointer = rhs.internalIntPointer
        var quotient = mp_int(used: 0, alloc: 0, sign: 0, dp: p)

        mp_init(&quotient)
        mp_div(pointer, otherPointer, &quotient, nil)

        pointer.deallocate(capacity: 1)
        otherPointer.deallocate(capacity: 1)

        return BigInteger(mpInt: quotient)
    }

    public func multiply(_ rhs: BigInteger) -> BigInteger {
        let p = UnsafeMutablePointer<mp_digit>.allocate(capacity: 1)
        let pointer = internalIntPointer
        let otherPointer = rhs.internalIntPointer
        var product = mp_int(used: 0, alloc: 0, sign: 0, dp: p)

        mp_init(&product)
        mp_mul(pointer, otherPointer, &product)

        pointer.deallocate(capacity: 1)
        otherPointer.deallocate(capacity: 1)

        return BigInteger(mpInt: product)
    }

    public func subtract(_ rhs: BigInteger) -> BigInteger {
        let p = UnsafeMutablePointer<mp_digit>.allocate(capacity: 1)
        let pointer = internalIntPointer
        let otherPointer = rhs.internalIntPointer
        var difference = mp_int(used: 0, alloc: 0, sign: 0, dp: p)

        mp_init(&difference)
        mp_sub(pointer, otherPointer, &difference)

        pointer.deallocate(capacity: 1)
        otherPointer.deallocate(capacity: 1)

        return BigInteger(mpInt: difference)
    }

    public func pow(_ exponent: UInt64) -> BigInteger {
        let pointer = UnsafeMutablePointer<mp_digit>.allocate(capacity: 1)
        let otherPointer = internalIntPointer
        var power = mp_int(used: 0, alloc: 0, sign: 0, dp: pointer)
        mp_init(&power)

        let result = mp_expt_d(otherPointer, exponent, &power)

        if result == MP_VAL {
            mp_clear(&power)
            return BigInteger(string: "0")
        }

        otherPointer.deallocate(capacity: 1)

        return BigInteger(mpInt: power)
    }
}

public extension BigInteger {
    public func add(_ rhs: Int) -> BigInteger {
        return add(BigInteger(int: rhs))
    }

    public func divide(_ rhs: Int) -> BigInteger {
        return divide(BigInteger(int: rhs))
    }

    public func multiply(_ rhs: Int) -> BigInteger {
        return multiply(BigInteger(int: rhs))
    }

    public func subtract(_ rhs: Int) -> BigInteger {
        return divide(BigInteger(int: rhs))
    }
}
