//
//  TSTwoDimensionalArrayTests.m
//  TSCollections
//
//  Created by Tobias Sundstrand on 2014-03-24.
//
//

#import <XCTest/XCTest.h>
#import "TSTwoDimensionalArray.h"
#import "TSExpandingArray.h"

@interface TSTwoDimensionalArrayTests : XCTestCase

@property(strong) TSTwoDimensionalArray *array;

@end

@implementation TSTwoDimensionalArrayTests

- (void)setUp {
    [super setUp];
    self.array = [[TSTwoDimensionalArray alloc] init];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown {
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testConvenienceCreation {
    XCTAssertEqualObjects(self.array, [TSTwoDimensionalArray array]);
}

- (void)testAddingAndGettingObject {
    [self.array setObject:@13 atRow:2 column:4];
    XCTAssertEqualObjects(@13, [self.array objectAtRow:2 column:4]);
}

- (void)testGettingObjectsAtRow {
    [self.array setObject:@7 atRow:1 column:0];
    [self.array setObject:@4 atRow:1 column:1];
    TSExpandingArray *row = [self.array objectsAtRow:1];
    XCTAssertTrue([row isKindOfClass:[TSExpandingArray class]]);
    XCTAssertEqual(row.count, 2U);
    XCTAssertEqualObjects([row objectAtIndex:0], @7);
    XCTAssertEqualObjects([row objectAtIndex:1], @4);
}

- (void)testGettingObjectsAtColumn {
    [self.array setObject:@12 atRow:0 column:1];
    [self.array setObject:@17 atRow:1 column:1];
    TSExpandingArray *column = [self.array objectsAtColumn:1];
    XCTAssertTrue([column isKindOfClass:[TSExpandingArray class]]);
    XCTAssertEqual(column.count, 2U);
    XCTAssertEqualObjects([column objectAtIndex:0], @12);
    XCTAssertEqualObjects([column objectAtIndex:1], @17);
}

- (void)testSubscriptGettingOfRows {
    [self.array setObject:@7 atRow:1 column:0];
    [self.array setObject:@4 atRow:1 column:1];
    TSExpandingArray *row = self.array[1];
    XCTAssertTrue([row isKindOfClass:[TSExpandingArray class]]);
    XCTAssertEqual(row.count, 2U);
    XCTAssertEqualObjects([row objectAtIndex:0], @7);
    XCTAssertEqualObjects([row objectAtIndex:1], @4);
}

- (void)testSubscriptGettingCell {
    [self.array setObject:@12 atRow:4 column:4];
    XCTAssertEqualObjects(@12, self.array[4][4]);
}

- (void)testSubscriptSettingOfObject {
    self.array[2][5] = @16;
    XCTAssertEqualObjects(@16, [self.array objectAtRow:2 column:5]);
}

- (void)testEquality {
    [self.array setObject:@12 atRow:2 column:4];
    TSTwoDimensionalArray *testArr = [TSTwoDimensionalArray array];
    [testArr setObject:@12 atRow:2 column:4];
    XCTAssertEqualObjects(self.array, testArr);
}

- (void)testRemovingObject {
    [self.array setObject:@15 atRow:0 column:0];
    [self.array removeObjectAtRow:0 column:0];
    XCTAssertEqualObjects([NSNull null], self.array[0][0]);
}

- (void)testRemoveRow {
    [self.array setObject:@73 atRow:0 column:0];
    [self.array setObject:@12 atRow:1 column:0];
    [self.array setObject:@14 atRow:0 column:1];
    [self.array removeRow:0];
    XCTAssertEqualObjects([NSNull null], self.array[0][0]);
    XCTAssertEqualObjects([NSNull null], self.array[0][1]);
    XCTAssertEqualObjects(@12, self.array[1][0]);
}

- (void)testRemoveColumn {
    [self.array setObject:@73 atRow:0 column:0];
    [self.array setObject:@12 atRow:1 column:0];
    [self.array setObject:@14 atRow:0 column:1];
    [self.array removeColumn:0];
    XCTAssertEqualObjects([NSNull null], self.array[0][0]);
    XCTAssertEqualObjects([NSNull null], self.array[0][0]);
    XCTAssertEqualObjects(@14, self.array[0][1]);
}

- (void)testCallRemoveOnNoneExistingCoordinate {
    [self.array setObject:@73 atRow:0 column:0];
    XCTAssertNoThrow([self.array removeObjectAtRow:1 column:1]);
}

- (void)testCallRemoveOnNoneExistingRow {
    [self.array setObject:@73 atRow:0 column:0];
    XCTAssertNoThrow([self.array removeRow:1]);
}

- (void)testCallRemoveOnNoneExistingColumn {
    [self.array setObject:@73 atRow:0 column:0];
    XCTAssertNoThrow([self.array removeColumn:1]);
}
@end
