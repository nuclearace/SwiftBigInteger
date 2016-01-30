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

class SwiftBigInteger: CustomStringConvertible, Equatable, Comparable {
    private var internalInt: mp_int
    
    var description: String {
        return stringValue
    }
    
    private var internalIntPointer: UnsafeMutablePointer<mp_int> {
        let pointer = UnsafeMutablePointer<mp_int>.alloc(1)
        pointer.initialize(internalInt)
        
        return pointer
    }
    
    var stringValue: String {
        var stringSize: Int32 = 0
        var stringArr: [Int8]
        let pointer = internalIntPointer
        
        mp_radix_size(pointer, 10, &stringSize)
        stringArr = [Int8](count: Int(stringSize), repeatedValue: 0)
        mp_toradix(pointer, &stringArr, 10)
        
        pointer.dealloc(1)
        pointer.destroy()
        return String(CString: &stringArr, encoding: NSUTF8StringEncoding)!
    }
    
    init(string: String, withRadix radix: Int) {
        let pointer = UnsafeMutablePointer<mp_digit>.alloc(1)
        internalInt = mp_int(used: 0, alloc: 0, sign: 0, dp: pointer)
        mp_init(&internalInt)
        mp_read_radix(&internalInt, string.cStringUsingEncoding(NSUTF8StringEncoding)!, Int32(radix))
        
        pointer.dealloc(1)
        pointer.destroy()
    }
    
    convenience init(string: String) {
        self.init(string: string, withRadix: 10)
    }
    
    convenience init(int: Int) {
        self.init(string: String(int))
    }
    
    private init(mpInt: mp_int) {
        internalInt = mpInt
    }
    
    deinit {
        mp_clear(&internalInt)
    }
}

extension SwiftBigInteger {
    func compare(rhs: SwiftBigInteger) -> NSComparisonResult {
        let comparisonResult = mp_cmp(rhs.internalIntPointer, internalIntPointer)
        
        switch comparisonResult {
        case MP_GT:
            return .OrderedAscending
        case MP_EQ:
            return .OrderedSame
        case MP_LT:
            return .OrderedDescending
        default:
            fatalError()
        }
    }
}

extension SwiftBigInteger {
    func add(rhs: SwiftBigInteger) -> SwiftBigInteger {
        let p = UnsafeMutablePointer<mp_digit>.alloc(1)
        let pointer = internalIntPointer
        let otherPointer = rhs.internalIntPointer
        var sum = mp_int(used: 0, alloc: 0, sign: 0, dp: p)
        
        mp_init(&sum)
        mp_add(pointer, otherPointer, &sum)
        
        pointer.dealloc(1)
        otherPointer.dealloc(1)
        
        return SwiftBigInteger(mpInt: sum)
    }
    
    func divide(rhs: SwiftBigInteger) -> SwiftBigInteger {
        let p = UnsafeMutablePointer<mp_digit>.alloc(1)
        let pointer = internalIntPointer
        let otherPointer = rhs.internalIntPointer
        var quotient = mp_int(used: 0, alloc: 0, sign: 0, dp: p)
        
        mp_init(&quotient)
        mp_div(pointer, otherPointer, &quotient, nil)
        
        pointer.dealloc(1)
        otherPointer.dealloc(1)
        
        return SwiftBigInteger(mpInt: quotient)
    }
    
    func multiply(rhs: SwiftBigInteger) -> SwiftBigInteger {
        let p = UnsafeMutablePointer<mp_digit>.alloc(1)
        let pointer = internalIntPointer
        let otherPointer = rhs.internalIntPointer
        var product = mp_int(used: 0, alloc: 0, sign: 0, dp: p)
        
        mp_init(&product)
        mp_mul(pointer, otherPointer, &product)
        
        pointer.dealloc(1)
        otherPointer.dealloc(1)
        
        return SwiftBigInteger(mpInt: product)
    }
    
    func subtract(rhs: SwiftBigInteger) -> SwiftBigInteger {
        let p = UnsafeMutablePointer<mp_digit>.alloc(1)
        let pointer = internalIntPointer
        let otherPointer = rhs.internalIntPointer
        var difference = mp_int(used: 0, alloc: 0, sign: 0, dp: p)
        
        mp_init(&difference)
        mp_sub(pointer, otherPointer, &difference)
        
        pointer.dealloc(1)
        otherPointer.dealloc(1)
        
        return SwiftBigInteger(mpInt: difference)
    }
    
    func pow(exponent: Int) -> SwiftBigInteger {
        let pointer = UnsafeMutablePointer<mp_digit>.alloc(1)
        let otherPointer = internalIntPointer
        var power = mp_int(used: 0, alloc: 0, sign: 0, dp: pointer)
        mp_init(&power)
        
        let result = mp_expt_d(otherPointer, UInt(exponent), &power)
        
        if result == MP_VAL {
            mp_clear(&power)
            return SwiftBigInteger(string: "0")
        }
        
        let new = SwiftBigInteger(mpInt: power)
        
        pointer.dealloc(1)
        otherPointer.dealloc(1)
        
        return new
    }
}

extension SwiftBigInteger {
    func add(rhs: Int) -> SwiftBigInteger {
        return add(SwiftBigInteger(int: rhs))
    }
    
    func divide(rhs: Int) -> SwiftBigInteger {
        return divide(SwiftBigInteger(int: rhs))
    }
    
    func multiply(rhs: Int) -> SwiftBigInteger {
        return multiply(SwiftBigInteger(int: rhs))
    }
    
    func subtract(rhs: Int) -> SwiftBigInteger {
        return divide(SwiftBigInteger(int: rhs))
    }
}
