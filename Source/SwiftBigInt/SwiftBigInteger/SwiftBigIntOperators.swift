//
//  SwiftBigIntOperators.swift
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

infix operator **

public extension SwiftBigInteger {
    public static func ==(lhs: SwiftBigInteger, rhs: SwiftBigInteger) -> Bool {
        return lhs.compare(rhs) == ComparisonResult.orderedSame
    }

    public static func ==(lhs: SwiftBigInteger, rhs: Int) -> Bool {
        return lhs == SwiftBigInteger(int: rhs)
    }

    public static func <(lhs: SwiftBigInteger, rhs: SwiftBigInteger) -> Bool {
        return lhs.compare(rhs) == ComparisonResult.orderedAscending
    }

    public static func >(lhs: SwiftBigInteger, rhs: Int) -> Bool {
        return lhs > SwiftBigInteger(int: rhs)
    }

    public static func <(lhs: SwiftBigInteger, rhs: Int) -> Bool {
        return lhs < SwiftBigInteger(int: rhs)
    }

    public static func +=(rhs: inout SwiftBigInteger, lhs: SwiftBigInteger) {
        rhs = rhs + lhs
    }

    public static func +=(rhs: inout SwiftBigInteger, lhs: Int) {
        rhs = rhs + lhs
    }

    public static func -=(rhs: inout SwiftBigInteger, lhs: SwiftBigInteger) {
        rhs = rhs - lhs
    }

    public static func -=(rhs: inout SwiftBigInteger, lhs: Int) {
        rhs = rhs - lhs
    }

    public static func *=(rhs: inout SwiftBigInteger, lhs: SwiftBigInteger) {
        rhs = rhs * lhs
    }

    public static func *=(rhs: inout SwiftBigInteger, lhs: Int) {
        rhs = rhs * lhs
    }

    public static func /=(rhs: inout SwiftBigInteger, lhs: SwiftBigInteger) {
        rhs = rhs / lhs
    }

    public static func /=(rhs: inout SwiftBigInteger, lhs: Int) {
        rhs = rhs / lhs
    }

    @available(*, unavailable)
    public static prefix func ++(rhs: inout SwiftBigInteger) -> SwiftBigInteger {
        rhs = rhs + 1

        return rhs
    }

    @available(*, unavailable)
    public static postfix func ++(rhs: inout SwiftBigInteger) -> SwiftBigInteger {
        let ret = rhs

        rhs = rhs + 1

        return ret
    }

    @available(*, unavailable)
    public static prefix func --(rhs: inout SwiftBigInteger) -> SwiftBigInteger {
        rhs = rhs - 1

        return rhs
    }

    @available(*, unavailable)
    public static postfix func --(rhs: inout SwiftBigInteger) -> SwiftBigInteger {
        let ret = rhs

        rhs = rhs - 1

        return ret
    }

    public static func +(lhs: SwiftBigInteger, rhs: SwiftBigInteger) -> SwiftBigInteger {
        return lhs.add(rhs)
    }

    public static func -(lhs: SwiftBigInteger, rhs: SwiftBigInteger) -> SwiftBigInteger {
        return lhs.subtract(rhs)
    }

    public static func /(lhs: SwiftBigInteger, rhs: SwiftBigInteger) -> SwiftBigInteger {
        return lhs.divide(rhs)
    }

    public static func *(lhs: SwiftBigInteger, rhs: SwiftBigInteger) -> SwiftBigInteger {
        return lhs.multiply(rhs)
    }

    public static func +(lhs: SwiftBigInteger, rhs: Int) -> SwiftBigInteger {
        return lhs.add(rhs)
    }

    public static func -(lhs: SwiftBigInteger, rhs: Int) -> SwiftBigInteger {
        return lhs.subtract(rhs)
    }

    public static func /(lhs: SwiftBigInteger, rhs: Int) -> SwiftBigInteger {
        return lhs.divide(rhs)
    }

    public static func *(lhs: SwiftBigInteger, rhs: Int) -> SwiftBigInteger {
        return lhs.multiply(rhs)
    }

    public static func **(lhs: SwiftBigInteger, rhs: UInt64) -> SwiftBigInteger {
        return lhs.pow(rhs)
    }
}
