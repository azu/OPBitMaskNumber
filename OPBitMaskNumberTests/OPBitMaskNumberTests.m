//
//  OPBitMaskNumberTests.m
//  OPBitMaskNumberTests
//
//  Created by azu on 2014/02/06.
//  Copyright (c) 2014 azu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OPBitMaskNumber.h"

typedef NS_ENUM(NSInteger, TestMaskType) {
    TestMaskTypeDefault = 1,
    TestMaskTypeValue1,
    TestMaskTypeValue2,
    TestMaskTypeSubSub
};

@interface OPBitMaskNumberTests : XCTestCase

@end

@implementation OPBitMaskNumberTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_initialize_assert {
    OPBitMaskNumber *bitMaskNumber = [[OPBitMaskNumber alloc] init];
    XCTAssertThrows([bitMaskNumber maskingBitToOnAtIndex:1], @"should be Assert");
}

- (void)test_masking_on {
    OPBitMaskNumber *bitMaskNumber = [OPBitMaskNumber bitMaskNumberWithValue:@(0)];
    XCTAssertFalse([bitMaskNumber stateAtIndex:TestMaskTypeDefault]);
    [bitMaskNumber maskingBitToOnAtIndex:TestMaskTypeDefault];
    XCTAssertTrue([bitMaskNumber stateAtIndex:TestMaskTypeDefault]);
    [bitMaskNumber maskingBitToOnAtIndex:TestMaskTypeSubSub];
    XCTAssertTrue([bitMaskNumber stateAtIndex:TestMaskTypeDefault]);
    XCTAssertFalse([bitMaskNumber stateAtIndex:TestMaskTypeValue1]);
    XCTAssertFalse([bitMaskNumber stateAtIndex:TestMaskTypeValue2]);
    XCTAssertTrue([bitMaskNumber stateAtIndex:TestMaskTypeSubSub]);
}

- (void)test_masking_off {
    OPBitMaskNumber *bitMaskNumber = [OPBitMaskNumber bitMaskNumberWithValue:@(0)];
    [bitMaskNumber maskingBitToOnAtIndex:TestMaskTypeDefault];
    XCTAssertTrue([bitMaskNumber stateAtIndex:TestMaskTypeDefault]);
    [bitMaskNumber maskingBitToOffAtIndex:TestMaskTypeDefault];
    XCTAssertFalse([bitMaskNumber stateAtIndex:TestMaskTypeDefault]);
}

- (void)test_masking_toggle {
    OPBitMaskNumber *bitMaskNumber = [OPBitMaskNumber bitMaskNumberWithValue:@(0)];
    [bitMaskNumber togglingBitAtIndex:TestMaskTypeDefault];
    XCTAssertTrue([bitMaskNumber stateAtIndex:TestMaskTypeDefault]);
    [bitMaskNumber togglingBitAtIndex:TestMaskTypeDefault];
    XCTAssertFalse([bitMaskNumber stateAtIndex:TestMaskTypeDefault]);
}
- (void)test_get_originalValue {
    OPBitMaskNumber *bitMaskNumber = [OPBitMaskNumber bitMaskNumberWithValue:@(0)];
    [bitMaskNumber maskingBitToOnAtIndex:TestMaskTypeDefault];
    XCTAssertNotEqualObjects(bitMaskNumber.originalValue, @1);
    [bitMaskNumber maskingBitToOnAtIndex:TestMaskTypeSubSub];
    // 2^0 + 2^3
    XCTAssertNotEqualObjects(bitMaskNumber.originalValue, @9);
}
@end
