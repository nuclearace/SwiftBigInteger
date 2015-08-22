//
//  SwiftBigInteger.swift
//  SwiftBigInt
//
//  Created by Erik Little on 7/1/15.
//  Copyright © 2015 Erik Little. All rights reserved.
//

import Foundation

struct SwiftBigInteger: CustomStringConvertible, Equatable, Comparable {
    let internalInt:JKBigInteger
    
    var description:String {
        return stringValue
    }
    
    var stringValue:String {
        return internalInt.stringValue()
    }
    
    init(numString:String) {
        internalInt = JKBigInteger(string: numString)
    }
    
    init(jkInteger:JKBigInteger) {
        internalInt = jkInteger
    }
    
    init(int:Int) {
        internalInt = JKBigInteger(string: String(int))
    }
}

extension SwiftBigInteger {
    func compare(rhs:SwiftBigInteger) -> NSComparisonResult {
        return internalInt.compare(rhs.internalInt)
    }
}

extension SwiftBigInteger {
    func add(rhs:SwiftBigInteger) -> SwiftBigInteger {
        let new = internalInt.add(rhs.internalInt)
        
        return SwiftBigInteger(jkInteger: new)
    }
    
    func divide(rhs:SwiftBigInteger) -> SwiftBigInteger {
        let new = internalInt.divide(rhs.internalInt)
        
        return SwiftBigInteger(jkInteger: new)
    }
    
    func multiply(rhs:SwiftBigInteger) -> SwiftBigInteger {
        let new = internalInt.multiply(rhs.internalInt)
        
        return SwiftBigInteger(jkInteger: new)
    }
    
    func subtract(rhs:SwiftBigInteger) -> SwiftBigInteger {
        let new = internalInt.subtract(rhs.internalInt)
        
        return SwiftBigInteger(jkInteger: new)
    }
}

extension SwiftBigInteger {
    func add(rhs:Int) -> SwiftBigInteger {
        let new = internalInt.add(JKBigInteger(string: String(rhs)))
        
        return SwiftBigInteger(jkInteger: new)
    }
    
    func divide(rhs:Int) -> SwiftBigInteger {
        let new = internalInt.divide(JKBigInteger(string: String(rhs)))
        
        return SwiftBigInteger(jkInteger: new)
    }
    
    func multiply(rhs:Int) -> SwiftBigInteger {
        let new = internalInt.multiply(JKBigInteger(string: String(rhs)))
        
        return SwiftBigInteger(jkInteger: new)
    }
    
    func subtract(rhs:Int) -> SwiftBigInteger {
        let new = internalInt.subtract(JKBigInteger(string: String(rhs)))
        
        return SwiftBigInteger(jkInteger: new)
    }
}
