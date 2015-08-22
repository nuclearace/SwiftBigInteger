//
//  JKBigInteger.h
//  JKBigInteger
//
//  Created by Jānis Kiršteins on 5/21/13.
//  Copyright (c) 2013 Jānis Kiršteins. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "tommath.h"

@interface JKBigInteger : NSObject <NSCoding>

- (id)initWithValue:(mp_int *)value;
- (mp_int *)value;

- (id)initWithUnsignedLong:(unsigned long)ul;
- (id)initWithString:(NSString *)string;
- (id)initWithString:(NSString *)string andRadix:(int)radix;
- (id)initWithCString:(char *)cString;
- (id)initWithCString:(char *)cString andRadix:(int)radix;

- (JKBigInteger*)add:(JKBigInteger *)bigInteger;
- (JKBigInteger*)subtract:(JKBigInteger *)bigInteger;
- (JKBigInteger*)multiply:(JKBigInteger *)bigInteger;
- (JKBigInteger*)divide:(JKBigInteger *)bigInteger;

- (JKBigInteger*)remainder:(JKBigInteger *)bigInteger;
- (NSArray *)divideAndRemainder:(JKBigInteger *)bigInteger;

- (JKBigInteger*)pow:(unsigned int)exponent;
- (JKBigInteger*)pow:(JKBigInteger*)exponent andMod:(JKBigInteger*)modulus;
- (JKBigInteger*)negate;
- (JKBigInteger*)abs;

- (JKBigInteger*)bitwiseXor:(JKBigInteger *)bigInteger;
- (JKBigInteger*)bitwiseOr:(JKBigInteger *)bigInteger;
- (JKBigInteger*)bitwiseAnd:(JKBigInteger *)bigInteger;
- (JKBigInteger*)shiftLeft:(unsigned int)n;
- (JKBigInteger*)shiftRight:(unsigned int)n;

- (JKBigInteger*)gcd:(JKBigInteger *)bigInteger;

- (NSComparisonResult) compare:(JKBigInteger *)bigInteger;

- (unsigned long)unsignedIntValue;
- (NSString *)stringValue;
- (NSString *)stringValueWithRadix:(int)radix;

- (NSString *)description;

- (unsigned int)countBytes;
- (void)toByteArraySigned: (unsigned char*) byteArray;
- (void)toByteArrayUnsigned: (unsigned char*) byteArray;

@end
