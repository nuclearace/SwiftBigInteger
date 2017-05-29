//
//  SwiftBigDecimal.swift
//  SwiftBigInt
//
//  Created by Erik Little on 8/22/15.
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

public class SwiftBigDecimal : CustomStringConvertible {
    var figure: UInt = 0
    var internalInteger: SwiftBigInteger

    public var description: String {
        return stringValue
    }

    public var stringValue: String {
        var string = internalInteger.stringValue

        if figure == 0 {
            return string
        } else {
            var newFigure = string.characters.count - Int(figure)

            while newFigure <= 0 {
                string.insert("0", at: string.startIndex)
                newFigure += 1
            }

            string.insert(".", at: string.index(string.startIndex, offsetBy: newFigure))

            return string
        }
    }

    public init(string: String) {
        if string.contains(".") {
            let range = string.range(of: ".")!
            figure = UInt(string[range.lowerBound..<string.characters.index(before: string.endIndex)].characters.count)
            internalInteger = SwiftBigInteger(string: string.replacingCharacters(in: range, with: ""))
        } else {
            internalInteger = SwiftBigInteger(string: string)
        }
    }

    public init(bigInteger: SwiftBigInteger, figure: Int) {
        internalInteger = bigInteger
        self.figure = UInt(figure)
    }

    public convenience init(int: Int) {
        self.init(string: String(int))
    }

    public convenience init(double: Double) {
        self.init(string: String(double))
    }
}

public extension SwiftBigDecimal {
    public func add(_ rhs: SwiftBigDecimal) -> SwiftBigDecimal {
        var maxFigure: UInt = 0

        if figure >= rhs.figure {
            maxFigure = figure
            let exponent = maxFigure - rhs.figure
            let powerInt = SwiftBigInteger(int: 10)
            let newInteger = powerInt.pow(Int(exponent))
            rhs.internalInteger *= newInteger
            rhs.figure = maxFigure
        } else {
            maxFigure = rhs.figure
            let exponent = maxFigure - figure
            let powerInt = SwiftBigInteger(int: 10)
            let newInteger = powerInt.pow(Int(exponent))
            internalInteger *= newInteger
            figure = maxFigure
        }

        let newInteger = internalInteger + rhs.internalInteger
        let newDecimal = SwiftBigDecimal(bigInteger: newInteger, figure: Int(maxFigure))

        return newDecimal
    }

    public func divide(_ rhs: SwiftBigDecimal) -> SwiftBigDecimal {
        var totalFigure = Int(figure - rhs.figure)

        if totalFigure < 0 {
            let exponent = -totalFigure
            totalFigure = 0
            let powerInt = SwiftBigInteger(int: 10)
            let newInteger = powerInt.pow(exponent)
            internalInteger *= newInteger
        }

        let newInteger = internalInteger / rhs.internalInteger
        let newDecimal = SwiftBigDecimal(bigInteger: newInteger, figure: Int(totalFigure))

        return newDecimal
    }

    public func multiply(_ rhs: SwiftBigDecimal) -> SwiftBigDecimal {
        let totalFigure = figure + rhs.figure
        let newInteger = internalInteger * rhs.internalInteger
        let newDecimal = SwiftBigDecimal(bigInteger: newInteger, figure: Int(totalFigure))

        return newDecimal
    }

    public func subtract(_ rhs: SwiftBigDecimal) -> SwiftBigDecimal {
        var maxFigure: UInt = 0

        if figure >= rhs.figure {
            maxFigure = figure
            let exponent = maxFigure - rhs.figure
            let powerInt = SwiftBigInteger(int: 10)
            let newInteger = powerInt.pow(Int(exponent))
            rhs.internalInteger *= newInteger
            rhs.figure = maxFigure
        } else {
            maxFigure = rhs.figure
            let exponent = maxFigure - figure
            let powerInt = SwiftBigInteger(int: 10)
            let newInteger = powerInt.pow(Int(exponent))
            internalInteger *= newInteger
            figure = maxFigure
        }

        let newInteger = internalInteger - rhs.internalInteger
        let newDecimal = SwiftBigDecimal(bigInteger: newInteger, figure: Int(maxFigure))

        return newDecimal
    }
}

public extension SwiftBigDecimal {
    public func add(_ rhs: Int) -> SwiftBigDecimal {
        return add(SwiftBigDecimal(string: String(rhs)))
    }

    public func divide(_ rhs: Int) -> SwiftBigDecimal {
        return divide(SwiftBigDecimal(string: String(rhs)))
    }

    public func multiply(_ rhs: Int) -> SwiftBigDecimal {
        return multiply(SwiftBigDecimal(string: String(rhs)))
    }

    public func subtract(_ rhs: Int) -> SwiftBigDecimal {
        return subtract(SwiftBigDecimal(string: String(rhs)))
    }
}

public extension SwiftBigDecimal {
    public func add(_ rhs: Double) -> SwiftBigDecimal {
        return add(SwiftBigDecimal(string: String(rhs)))
    }

    public func divide(_ rhs: Double) -> SwiftBigDecimal {
        return divide(SwiftBigDecimal(string: String(rhs)))
    }

    public func multiply(_ rhs: Double) -> SwiftBigDecimal {
        return multiply(SwiftBigDecimal(string: String(rhs)))
    }

    public func subtract(_ rhs: Double) -> SwiftBigDecimal {
        return subtract(SwiftBigDecimal(string: String(rhs)))
    }
}
