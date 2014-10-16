//
//  TSExpandingArrayTests.m
//  TSCollections
//
//  Created by Tobias Sundstrand on 2014-03-24.
//
//

#import <XCTest/XCTest.h>
#import "TSExpandingArray.h"

@interface TSExpandingArrayTests : XCTestCase

@property(strong) TSExpandingArray *array;

@end

@implementation TSExpandingArrayTests

- (void)setUp {
    [super setUp];
    self.array = [TSExpandingArray new];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testConvenienceWithSize {
    TSExpandingArray *arr = [TSExpandingArray arrayWithSize:100064U];
    XCTAssertEqual(arr.count, 100064U);
}

- (void)testInitWithSize {
    TSExpandingArray *arr = [[TSExpandingArray alloc] initWithSize:25U];
    XCTAssertEqual(arr.count, 25U);
}

- (void)testInitializeWithSize0 {
    TSExpandingArray *arr = [[TSExpandingArray alloc] initWithSize:0];
    XCTAssertEqual(arr.count, 0U);
}

- (void)testAccessingObjectAtIndexOutOfBounds {
    id object = [self.array objectAtIndex:3];
    XCTAssertNotNil(object);
    XCTAssertEqualObjects(object, [NSNull null]);
}

- (void)testSettingObjectOutOfBounds {
    [self.array setObject:@13 atIndex:2];
    XCTAssertEqualObjects(@13, [self.array objectAtIndex:2]);
}

- (void)testAutoExpandToCorrectSizeOnSet {
    [self.array setObject:@15 atIndex:15];
    XCTAssertEqual(self.array.count, 16U);
}

- (void)testAutoExpandToCorrectSizeOnGet {
    id object = [self.array objectAtIndex:15];
    XCTAssertEqualObjects(object, [NSNull null]);
    XCTAssertEqual(self.array.count, 16U);
}

- (void)testSettingTwoObjects {
    [self.array setObject:@1 atIndex:6];
    [self.array setObject:@5 atIndex:20];
    XCTAssertEqualObjects([self.array objectAtIndex:6], @1);
    XCTAssertEqualObjects([self.array objectAtIndex:20], @5);
}

- (void)testSettingTwoObjectsSubscriptSyntax {
    self.array[6] = @34;
    self.array[14] = @8;
    XCTAssertEqualObjects(self.array[6], @34);
    XCTAssertEqualObjects(self.array[14], @8);
}

- (void)testSettingAndGettingOtherIndex {
    self.array[1] = @1;
    XCTAssertEqualObjects([NSNull null], self.array[2]);
}

- (void)testSettingFillOutClass {
    TSExpandingArray *fillOutArray = [[TSExpandingArray alloc] initWithSize:4 fillOutClass:[TSExpandingArray class]];
    XCTAssertNotNil(fillOutArray[2]);
    XCTAssertTrue([fillOutArray[3] isKindOfClass:[TSExpandingArray class]]);
}

- (void)testIsEqual {
    TSExpandingArray *array1 = [[TSExpandingArray alloc] initWithSize:3];
    TSExpandingArray *array2 = [[TSExpandingArray alloc] initWithSize:3];
    XCTAssertNotEqualObjects(self.array, array1);
    XCTAssertNotEqualObjects(self.array, array2);
    XCTAssertEqualObjects(array1, array2);
}

- (void)testDeletingObject {
    self.array[6] = @34;
    self.array[14] = @8;
    XCTAssertEqual(self.array.count, 15U);
    [self.array removeObjectAtIndex:14];
    XCTAssertEqual(self.array.count, 15U);
    XCTAssertEqualObjects(self.array[14], [NSNull null]);
}

- (void)testFilteringExpandingArray {
    self.array[3] = @13;
    TSExpandingArray *filtered = [self.array filterWithBlock:^BOOL(id object) {
        return [object isKindOfClass:[NSNumber class]];
    }];
    XCTAssertEqual(filtered.count, 1U);
    XCTAssertEqualObjects(filtered[0], @13);
}

- (void)testMappingExpandingArray {
    self.array[0] = @1;
    self.array[2] = @4;
    self.array[4] = @6;
    TSExpandingArray *mapped = [self.array mapWithBlock:^id(NSNumber *object) {
        return [object isKindOfClass:[NSNumber class]] ? @(object.intValue * 2) : @0;
    }];
    XCTAssertTrue([mapped isKindOfClass:[TSExpandingArray class]]);
    XCTAssertEqual(mapped.count, 5U);
    XCTAssertEqualObjects(mapped[0], @2);
    XCTAssertEqualObjects(mapped[1], @0);
    XCTAssertEqualObjects(mapped[2], @8);
    XCTAssertEqualObjects(mapped[3], @0);
    XCTAssertEqualObjects(mapped[4], @12);
}

- (void)testRemovingAllObjects {
    self.array[1]= @5;
    XCTAssertEqual(self.array.count, 2);
    [self.array removeAllObjects];
    XCTAssertEqual(self.array.count, 0);
}

@end
