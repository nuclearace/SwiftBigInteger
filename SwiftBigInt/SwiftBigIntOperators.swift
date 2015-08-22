//
//  SwiftBigIntOperators.swift
//  SwiftBigInt
//
//  Created by Erik Little on 7/1/15.
//  Copyright © 2015 Erik Little. All rights reserved.
//

import Foundation

func ==(lhs: SwiftBigInteger, rhs: SwiftBigInteger) -> Bool {
    return lhs.compare(rhs) == NSComparisonResult.OrderedSame
}

func ==(lhs: SwiftBigInteger, rhs: Int) -> Bool {
    return lhs == SwiftBigInteger(int: rhs)
}

func <(lhs: SwiftBigInteger, rhs: SwiftBigInteger) -> Bool {
    return lhs.compare(rhs) == NSComparisonResult.OrderedAscending
}

func >(lhs: SwiftBigInteger, rhs: Int) -> Bool {
    return lhs > SwiftBigInteger(int: rhs)
}

func <(lhs: SwiftBigInteger, rhs: Int) -> Bool {
    return lhs < SwiftBigInteger(int: rhs)
}

prefix func ++(inout rhs: SwiftBigInteger) -> SwiftBigInteger {
    rhs = rhs + 1
    
    return rhs
}

postfix func ++(inout rhs: SwiftBigInteger) -> SwiftBigInteger {
    let ret = rhs
    
    rhs = rhs + 1
    
    return ret
}

prefix func --(inout rhs: SwiftBigInteger) -> SwiftBigInteger {
    rhs = rhs - 1
    
    return rhs
}

postfix func --(inout rhs: SwiftBigInteger) -> SwiftBigInteger {
    let ret = rhs
    
    rhs = rhs - 1
    
    return ret
}

func +(lhs: SwiftBigInteger, rhs: SwiftBigInteger) -> SwiftBigInteger {
    return lhs.add(rhs)
}

func -(lhs: SwiftBigInteger, rhs: SwiftBigInteger) -> SwiftBigInteger {
    return lhs.subtract(rhs)
}

func /(lhs: SwiftBigInteger, rhs: SwiftBigInteger) -> SwiftBigInteger {
    return lhs.divide(rhs)
}

func *(lhs: SwiftBigInteger, rhs: SwiftBigInteger) -> SwiftBigInteger {
    return lhs.multiply(rhs)
}

func +(lhs: SwiftBigInteger, rhs: Int) -> SwiftBigInteger {
    return lhs.add(rhs)
}

func -(lhs: SwiftBigInteger, rhs: Int) -> SwiftBigInteger {
    return lhs.subtract(rhs)
}

func /(lhs: SwiftBigInteger, rhs: Int) -> SwiftBigInteger {
    return lhs.divide(rhs)
}

func *(lhs: SwiftBigInteger, rhs: Int) -> SwiftBigInteger {
    return lhs.multiply(rhs)
}