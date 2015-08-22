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

struct SwiftBigInteger: CustomStringConvertible, Equatable, Comparable {
    let internalInt: JKBigInteger
    
    var description: String {
        return stringValue
    }
    
    var stringValue: String {
        return internalInt.stringValue()
    }
    
    init(numString: String) {
        internalInt = JKBigInteger(string: numString)
    }
    
    init(jkInteger: JKBigInteger) {
        internalInt = jkInteger
    }
    
    init(int: Int) {
        internalInt = JKBigInteger(string: String(int))
    }
}

extension SwiftBigInteger {
    func compare(rhs: SwiftBigInteger) -> NSComparisonResult {
        return internalInt.compare(rhs.internalInt)
    }
}

extension SwiftBigInteger {
    func add(rhs: SwiftBigInteger) -> SwiftBigInteger {
        let new = internalInt.add(rhs.internalInt)
        
        return SwiftBigInteger(jkInteger: new)
    }
    
    func divide(rhs: SwiftBigInteger) -> SwiftBigInteger {
        let new = internalInt.divide(rhs.internalInt)
        
        return SwiftBigInteger(jkInteger: new)
    }
    
    func multiply(rhs: SwiftBigInteger) -> SwiftBigInteger {
        let new = internalInt.multiply(rhs.internalInt)
        
        return SwiftBigInteger(jkInteger: new)
    }
    
    func subtract(rhs: SwiftBigInteger) -> SwiftBigInteger {
        let new = internalInt.subtract(rhs.internalInt)
        
        return SwiftBigInteger(jkInteger: new)
    }
}

extension SwiftBigInteger {
    func add(rhs: Int) -> SwiftBigInteger {
        let new = internalInt.add(JKBigInteger(string: String(rhs)))
        
        return SwiftBigInteger(jkInteger: new)
    }
    
    func divide(rhs: Int) -> SwiftBigInteger {
        let new = internalInt.divide(JKBigInteger(string: String(rhs)))
        
        return SwiftBigInteger(jkInteger: new)
    }
    
    func multiply(rhs: Int) -> SwiftBigInteger {
        let new = internalInt.multiply(JKBigInteger(string: String(rhs)))
        
        return SwiftBigInteger(jkInteger: new)
    }
    
    func subtract(rhs: Int) -> SwiftBigInteger {
        let new = internalInt.subtract(JKBigInteger(string: String(rhs)))
        
        return SwiftBigInteger(jkInteger: new)
    }
}
