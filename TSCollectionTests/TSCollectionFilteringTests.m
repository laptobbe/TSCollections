//
//  TSCollectionFilteringTests.m
//  TSCollections
//
//  Created by Tobias Sundstrand on 2014-04-17.
//
//

#import <XCTest/XCTest.h>
#import "TSCollectionHigherOrderFunctions.h"

@interface TSCollectionFilteringTests : XCTestCase

@end

@implementation TSCollectionFilteringTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFilteringArray {
    NSArray *array = @[@2,@9,@1,@4];
    NSArray *filtered = [TSCollectionHigherOrderFunctions filter:array withBlock:^BOOL(NSNumber *object) {
        return object.intValue > 3;
    }];

    XCTAssertTrue([filtered isKindOfClass:[NSArray class]]);
    NSArray *testArray = @[@9,@4];
    XCTAssertEqualObjects(filtered, testArray);
}

- (void)testFilteringSet {
    NSSet *set = [NSSet setWithArray:@[@1,@2,@3,@4]];
    NSSet *filtered = [TSCollectionHigherOrderFunctions filter:set withBlock:^BOOL(NSNumber *object) {
        return object.intValue % 2 == 0;
    }];
    XCTAssertTrue([filtered isKindOfClass:[NSSet class]]);
    NSSet *testSet = [NSSet setWithArray:@[@2,@4]];
    XCTAssertEqualObjects(filtered, testSet);
}

- (void)testFilteringOrderedSet {
    NSOrderedSet *set = [NSOrderedSet orderedSetWithArray:@[@1,@2,@3]];
    NSOrderedSet *filtered = [TSCollectionHigherOrderFunctions filter:set withBlock:^BOOL(NSNumber *object) {
        return object.intValue * 2 > 2;
    }];
    XCTAssertTrue([filtered isKindOfClass:[NSOrderedSet class]]);
    NSOrderedSet *testSet = [NSOrderedSet orderedSetWithArray:@[@2,@3]];
    XCTAssertEqualObjects(filtered, testSet);
}

- (void)testFilteringArrayWithCategory {
    NSArray *array = @[@2,@9,@1,@4];
    NSArray *filtered = [array filterWithBlock:^BOOL(NSNumber *object) {
        return object.intValue > 3;
    }];

    XCTAssertTrue([filtered isKindOfClass:[NSArray class]]);
    NSArray *testArray = @[@9,@4];
    XCTAssertEqualObjects(filtered, testArray);
}

@end
