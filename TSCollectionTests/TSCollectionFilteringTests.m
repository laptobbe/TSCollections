//
//  TSCollectionFilteringTests.m
//  TSCollections
//
//  Created by Tobias Sundstrand on 2014-04-17.
//
//

#import <XCTest/XCTest.h>
#import "TSCollectionOperations.h"

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
    NSArray *filtered = [TSCollectionOperations filter:array withBlock:^BOOL(NSNumber *object) {
        return object.intValue > 3;
    }];

    XCTAssertTrue([filtered isKindOfClass:[NSArray class]]);
    NSArray *testArray = @[@9,@4];
    XCTAssertEqualObjects(filtered, testArray);
}

- (void)testFilteringSet {
    NSSet *set = [NSSet setWithArray:@[@1,@2,@3,@4]];
    NSSet *filtered = [TSCollectionOperations filter:set withBlock:^BOOL(NSNumber *object) {
        return object.intValue % 2 == 0;
    }];
    XCTAssertTrue([filtered isKindOfClass:[NSSet class]]);
    NSSet *testSet = [NSSet setWithArray:@[@2,@4]];
    XCTAssertEqualObjects(filtered, testSet);
}

- (void)testFilteringOrderedSet {
    NSOrderedSet *set = [NSOrderedSet orderedSetWithArray:@[@1,@2,@3]];
    NSOrderedSet *filtered = [TSCollectionOperations filter:set withBlock:^BOOL(NSNumber *object) {
        return object.intValue * 2 > 2;
    }];
    XCTAssertTrue([filtered isKindOfClass:[NSOrderedSet class]]);
    NSOrderedSet *testSet = [NSOrderedSet orderedSetWithArray:@[@2,@3]];
    XCTAssertEqualObjects(filtered, testSet);
}

- (void)testFilteringNSDictionary {
    NSDictionary *dic = @{@"12" : @"Cecilia", @"164" : @"Tobias", @"94" : @"Emil"};
    NSDictionary *filtered = [TSCollectionOperations filter:dic withBlock:^BOOL(NSString *key) {
        NSString *name = dic[key];
        return name.length > 4;
    }];
    XCTAssertTrue([filtered isKindOfClass:[NSDictionary class]]);
    NSDictionary *testDic = @{@"12" : @"Cecilia", @"164" : @"Tobias"};
    XCTAssertEqualObjects(testDic, filtered);
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

- (void)testFilteringDictionaryWithCategory {
    NSDictionary *dic = @{@"12" : @"Cecilia", @"164" : @"Tobias", @"94" : @"Emil"};
    NSDictionary *filtered = [dic filterWithBlock:^BOOL(NSString *key) {
        NSString *name = dic[key];
        return name.length > 4;
    }];
    XCTAssertTrue([filtered isKindOfClass:[NSDictionary class]]);
    NSDictionary *testDic = @{@"12" : @"Cecilia", @"164" : @"Tobias"};
    XCTAssertEqualObjects(testDic, filtered);
}

- (void)testFilteringSetWithCategory {
    NSSet *set = [NSSet setWithArray:@[@1,@2,@3,@4]];
    NSSet *filtered = [set filterWithBlock:^BOOL(NSNumber *object) {
        return object.intValue % 2 == 0;
    }];
    XCTAssertTrue([filtered isKindOfClass:[NSSet class]]);
    NSSet *testSet = [NSSet setWithArray:@[@2,@4]];
    XCTAssertEqualObjects(filtered, testSet);
}

- (void)testFilteringOrderedSetWithCategory {
    NSOrderedSet *set = [NSOrderedSet orderedSetWithArray:@[@1,@2,@3]];
    NSOrderedSet *filtered = [set filterWithBlock:^BOOL(NSNumber *object) {
        return object.intValue * 2 > 2;
    }];
    XCTAssertTrue([filtered isKindOfClass:[NSOrderedSet class]]);
    NSOrderedSet *testSet = [NSOrderedSet orderedSetWithArray:@[@2,@3]];
    XCTAssertEqualObjects(filtered, testSet);
}

@end
