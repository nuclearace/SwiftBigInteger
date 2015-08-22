//
//  JKBigDecimal.h
//  JKBigInteger
//
//  Created by Midfar Sun on 5/4/15.
//  Copyright (c) 2015 Midfar Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKBigInteger.h"

@interface JKBigDecimal : NSObject <NSCoding>

@property(nonatomic, retain)JKBigInteger *bigInteger;
@property(nonatomic, assign)NSUInteger figure;//小数位数

+ (id)decimalWithString:(NSString *)string;
- (id)initWithString:(NSString *)string;

- (JKBigDecimal*)add:(JKBigDecimal *)bigDecimal;
- (JKBigDecimal*)subtract:(JKBigDecimal *)bigDecimal;
- (JKBigDecimal*)multiply:(JKBigDecimal *)bigDecimal;
- (JKBigDecimal*)divide:(JKBigDecimal *)bigDecimal;

- (JKBigDecimal*)remainder:(JKBigDecimal *)bigInteger;
//- (NSArray *)divideAndRemainder:(JKBigDecimal *)bigInteger;

- (JKBigDecimal*)pow:(unsigned int)exponent;

- (JKBigDecimal*)negate;
- (JKBigDecimal*)abs;

- (NSString *)stringValue;

- (NSString *)description;

@end
