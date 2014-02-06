//
// Created by azu on 2014/02/06.
//

#import "OPBitMaskNumber.h"

@implementation OPBitMaskNumber
- (instancetype)initWithValue:(NSNumber *) originalValue {
    self = [super init];
    if (self == nil) {
        return nil;
    }
    _originalValue = originalValue;
    return self;
}

+ (instancetype)bitMaskNumberWithValue:(NSNumber *) originalValue {
    return [[self alloc] initWithValue:originalValue];
}

- (NSInteger)p_originalPrimitive {
    NSAssert(self.originalValue != nil, @"must be set originalValue");
    return [self.originalValue unsignedIntValue];
}

#pragma mark - get
- (BOOL)stateAtIndex:(NSUInteger) index {
    return (self.p_originalPrimitive & (1 << index)) != 0;
}
#pragma mark - set


- (void)maskingBitToOnAtIndex:(NSUInteger) index {
    self.originalValue = @(self.p_originalPrimitive | (1 << index));
}

- (void)maskingBitToOffAtIndex:(NSUInteger) index {
    self.originalValue = @(self.p_originalPrimitive & ~(1 << index));

}

- (void)togglingBitAtIndex:(NSUInteger) index {
    self.originalValue = @(self.p_originalPrimitive ^ (1 << index));
}


#pragma mark - debug
NSString *p_binaryStringFromInteger(int number) {
    NSMutableString *string = [[NSMutableString alloc] init];
    int spacing = (int)pow(2, 3);
    int width = (sizeof( number )) * spacing;
    int binaryDigit = 0;
    int integer = number;
    while (binaryDigit < width) {
        binaryDigit++;
        [string insertString:((integer & 1) ? @"1" : @"0") atIndex:0];
        if (binaryDigit % spacing == 0 && binaryDigit != width) {
            [string insertString:@" " atIndex:0];
        }
        integer = integer >> 1;
    }
    return string;
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass(
        [self class])];
    [description appendFormat:@"self.originalValue=%@>\n", self.originalValue];
    [description appendFormat:@"BitPattern: %@", p_binaryStringFromInteger(
        [self.originalValue unsignedIntValue])];
    return description;
}


@end