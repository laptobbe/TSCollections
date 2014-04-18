//
//  TSCollectionMappingTests.m
//  TSCollections
//
//  Created by Tobias Sundstrand on 2014-04-18.
//
//

#import <XCTest/XCTest.h>
#import "TSCollectionHigherOrderFunctions.h"

@interface TSCollectionMappingTests : XCTestCase

@end

@implementation TSCollectionMappingTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMappingArray {
    NSArray *array = @[@{@"name": @"Matthew"}, @{@"name": @"Sara"}, @{@"name" : @"Cecilia"}];
    NSArray *mapped = [TSCollectionHigherOrderFunctions map:array withBlock:^NSString *(NSDictionary *object) {
        return [object objectForKey:@"name"];
    }];
    XCTAssertNotNil(mapped);
    XCTAssertTrue([mapped isKindOfClass:[NSArray class]]);
    NSArray *testArray = @[@"Matthew", @"Sara", @"Cecilia"];
    XCTAssertEqualObjects(mapped, testArray);
}

- (void)testMappingSet {
    NSSet *set = [NSSet setWithArray:@[@{@"name": @"Matthew"}, @{@"name": @"Sara"}, @{@"name" : @"Cecilia"}]];
    NSSet *mapped = [TSCollectionHigherOrderFunctions map:set withBlock:^NSString *(NSDictionary *object) {
        return [object objectForKey:@"name"];
    }];
    XCTAssertNotNil(mapped);
    XCTAssertTrue([mapped isKindOfClass:[NSSet class]]);
    NSSet *testSet = [NSSet setWithArray:@[@"Matthew", @"Sara", @"Cecilia"]];
    XCTAssertEqualObjects(mapped, testSet);
}

- (void)testMappingOrderedSet {
    NSOrderedSet *set = [NSOrderedSet orderedSetWithArray:@[@{@"name": @"Matthew"}, @{@"name": @"Sara"}, @{@"name" : @"Cecilia"}]];
    NSOrderedSet *mapped = [TSCollectionHigherOrderFunctions map:set withBlock:^NSString *(NSDictionary *object) {
        return [object objectForKey:@"name"];
    }];
    XCTAssertNotNil(mapped);
    XCTAssertTrue([mapped isKindOfClass:[NSOrderedSet class]]);
    NSOrderedSet *testSet = [NSOrderedSet orderedSetWithArray:@[@"Matthew", @"Sara", @"Cecilia"]];
    XCTAssertEqualObjects(mapped, testSet);
}

- (void)testMappingReturnNil {
    NSArray *array = @[@{@"name": @"Matthew"}, @{@"name": @"Sara"}, @{@"name" : @"Cecilia"}, @{@"no_name":@"no_name"}];
    NSArray *mapped = [TSCollectionHigherOrderFunctions map:array withBlock:^NSString *(NSDictionary *object) {
        return [object objectForKey:@"name"];
    }];
    XCTAssertNotNil(mapped);
    XCTAssertTrue([mapped isKindOfClass:[NSArray class]]);
    NSArray *testArray = @[@"Matthew", @"Sara", @"Cecilia"];
    XCTAssertEqualObjects(mapped, testArray);
}
@end
