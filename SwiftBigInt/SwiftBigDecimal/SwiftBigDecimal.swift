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

struct SwiftBigDecimal: CustomStringConvertible, Comparable {
    let internalDecimal: JKBigDecimal
    
    var description: String {
        return stringValue
    }
    
    var stringValue: String {
        return internalDecimal.stringValue()
    }
    
    init(numString: String) {
        internalDecimal = JKBigDecimal(string: numString)
    }
    
    init(jkDecimal: JKBigDecimal) {
        internalDecimal = jkDecimal
    }
    
    init(int: Int) {
        internalDecimal = JKBigDecimal(string: String(int))
    }
}

extension SwiftBigDecimal {
    func add(rhs: SwiftBigDecimal) -> SwiftBigDecimal {
        let new = internalDecimal.add(rhs.internalDecimal)
        
        return SwiftBigDecimal(jkDecimal: new)
    }
    
    func divide(rhs: SwiftBigDecimal) -> SwiftBigDecimal {
        let new = internalDecimal.divide(rhs.internalDecimal)
        
        return SwiftBigDecimal(jkDecimal: new)
    }
    
    func multiply(rhs: SwiftBigDecimal) -> SwiftBigDecimal {
        let new = internalDecimal.multiply(rhs.internalDecimal)
        
        return SwiftBigDecimal(jkDecimal: new)
    }
    
    func subtract(rhs: SwiftBigDecimal) -> SwiftBigDecimal {
        let new = internalDecimal.subtract(rhs.internalDecimal)
        
        return SwiftBigDecimal(jkDecimal: new)
    }
}

extension SwiftBigDecimal {
    func add(rhs: Int) -> SwiftBigDecimal {
        let new = internalDecimal.add(JKBigDecimal(string: String(rhs)))
        
        return SwiftBigDecimal(jkDecimal: new)
    }
    
    func divide(rhs: Int) -> SwiftBigDecimal {
        let new = internalDecimal.divide(JKBigDecimal(string: String(rhs)))
        
        return SwiftBigDecimal(jkDecimal: new)
    }
    
    func multiply(rhs: Int) -> SwiftBigDecimal {
        let new = internalDecimal.multiply(JKBigDecimal(string: String(rhs)))
        
        return SwiftBigDecimal(jkDecimal: new)
    }
    
    func subtract(rhs: Int) -> SwiftBigDecimal {
        let new = internalDecimal.subtract(JKBigDecimal(string: String(rhs)))
        
        return SwiftBigDecimal(jkDecimal: new)
    }
}
