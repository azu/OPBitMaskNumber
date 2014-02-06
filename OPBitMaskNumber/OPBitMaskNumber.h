//
//  OPBitMaskNumber.h
//  OPBitMaskNumber
//
//  Created by azu on 2014/02/06.
//  Copyright (c) 2014 azu. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface OPBitMaskNumber : NSObject
@property(nonatomic, strong) NSNumber *originalValue;

- (instancetype)initWithValue:(NSNumber *) originalValue;

+ (instancetype)bitMaskNumberWithValue:(NSNumber *) originalValue;
#pragma mark - get
- (BOOL)stateAtIndex:(NSUInteger) index;
#pragma mark - set
- (void)maskingBitToOnAtIndex:(NSUInteger) index;

- (void)maskingBitToOffAtIndex:(NSUInteger) index;

- (void)togglingBitAtIndex:(NSUInteger) index;
#pragma mark - description
- (NSString *)description;
@end