//
//  TSCollectionMappingTests.m
//  TSCollections
//
//  Created by Tobias Sundstrand on 2014-04-18.
//
//

#import <XCTest/XCTest.h>
#import "TSCollectionOperations.h"

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
    NSArray *array = @[@{@"name" : @"Matthew"}, @{@"name" : @"Sara"}, @{@"name" : @"Cecilia"}];
    NSArray *mapped = [TSCollectionOperations map:array withBlock:^NSString *(NSDictionary *object) {
        return [object objectForKey:@"name"];
    }];
    XCTAssertNotNil(mapped);
    XCTAssertTrue([mapped isKindOfClass:[NSArray class]]);
    NSArray *testArray = @[@"Matthew", @"Sara", @"Cecilia"];
    XCTAssertEqualObjects(mapped, testArray);
}

- (void)testMappingSet {
    NSSet *set = [NSSet setWithArray:@[@{@"name" : @"Matthew"}, @{@"name" : @"Sara"}, @{@"name" : @"Cecilia"}]];
    NSSet *mapped = [TSCollectionOperations map:set withBlock:^NSString *(NSDictionary *object) {
        return [object objectForKey:@"name"];
    }];
    XCTAssertNotNil(mapped);
    XCTAssertTrue([mapped isKindOfClass:[NSSet class]]);
    NSSet *testSet = [NSSet setWithArray:@[@"Matthew", @"Sara", @"Cecilia"]];
    XCTAssertEqualObjects(mapped, testSet);
}

- (void)testMappingOrderedSet {
    NSOrderedSet *set = [NSOrderedSet orderedSetWithArray:@[@{@"name" : @"Matthew"}, @{@"name" : @"Sara"}, @{@"name" : @"Cecilia"}]];
    NSOrderedSet *mapped = [TSCollectionOperations map:set withBlock:^NSString *(NSDictionary *object) {
        return [object objectForKey:@"name"];
    }];
    XCTAssertNotNil(mapped);
    XCTAssertTrue([mapped isKindOfClass:[NSOrderedSet class]]);
    NSOrderedSet *testSet = [NSOrderedSet orderedSetWithArray:@[@"Matthew", @"Sara", @"Cecilia"]];
    XCTAssertEqualObjects(mapped, testSet);
}

- (void)testMappingDictionary {
    NSDictionary *dic = @{@"134" : @{@"name" : @"Cecilia"}, @"153" : @{@"name" : @"Tobias"}, @"93" : @{@"name" : @"Emil"}};
    NSDictionary *mapped = [TSCollectionOperations map:dic withBlock:^id(NSString *key) {
        return dic[key][@"name"];
    }];
    XCTAssertNotNil(mapped);
    XCTAssertTrue([mapped isKindOfClass:[NSDictionary class]]);
    XCTAssertEqualObjects(mapped[@"134"], @"Cecilia");
    XCTAssertEqualObjects(mapped[@"153"], @"Tobias");
    XCTAssertEqualObjects(mapped[@"93"], @"Emil");
}

- (void)testMappingReturnNil {
    NSArray *array = @[@{@"name" : @"Matthew"}, @{@"name" : @"Sara"}, @{@"name" : @"Cecilia"}, @{@"no_name" : @"no_name"}];
    NSArray *mapped = [TSCollectionOperations map:array withBlock:^NSString *(NSDictionary *object) {
        return [object objectForKey:@"name"];
    }];
    XCTAssertNotNil(mapped);
    XCTAssertTrue([mapped isKindOfClass:[NSArray class]]);
    NSArray *testArray = @[@"Matthew", @"Sara", @"Cecilia"];
    XCTAssertEqualObjects(mapped, testArray);
}

- (void)testMappingArrayWithCategory {
    NSArray *array = @[@{@"name" : @"Matthew"}, @{@"name" : @"Sara"}, @{@"name" : @"Cecilia"}];
    NSArray *mapped = [array mapWithBlock:^NSString *(NSDictionary *object) {
        return [object objectForKey:@"name"];
    }];
    XCTAssertNotNil(mapped);
    XCTAssertTrue([mapped isKindOfClass:[NSArray class]]);
    NSArray *testArray = @[@"Matthew", @"Sara", @"Cecilia"];
    XCTAssertEqualObjects(mapped, testArray);
}

- (void)testMappingSetWithCategory {
    NSSet *set = [NSSet setWithArray:@[@{@"name" : @"Matthew"}, @{@"name" : @"Sara"}, @{@"name" : @"Cecilia"}]];
    NSSet *mapped = [set mapWithBlock:^NSString *(NSDictionary *object) {
        return [object objectForKey:@"name"];
    }];
    XCTAssertNotNil(mapped);
    XCTAssertTrue([mapped isKindOfClass:[NSSet class]]);
    NSSet *testSet = [NSSet setWithArray:@[@"Matthew", @"Sara", @"Cecilia"]];
    XCTAssertEqualObjects(mapped, testSet);
}

- (void)testMappingOrderedSetWithCategory {
    NSOrderedSet *set = [NSOrderedSet orderedSetWithArray:@[@{@"name" : @"Matthew"}, @{@"name" : @"Sara"}, @{@"name" : @"Cecilia"}]];
    NSOrderedSet *mapped = [set mapWithBlock:^NSString *(NSDictionary *object) {
        return [object objectForKey:@"name"];
    }];
    XCTAssertNotNil(mapped);
    XCTAssertTrue([mapped isKindOfClass:[NSOrderedSet class]]);
    NSOrderedSet *testSet = [NSOrderedSet orderedSetWithArray:@[@"Matthew", @"Sara", @"Cecilia"]];
    XCTAssertEqualObjects(mapped, testSet);
}

- (void)testMappingDictionaryWithCategory {
    NSDictionary *dic = @{@"134" : @{@"name" : @"Cecilia"}, @"153" : @{@"name" : @"Tobias"}, @"93" : @{@"name" : @"Emil"}};
    NSDictionary *mapped = [dic mapWithBlock:^id(NSString *key) {
        return dic[key][@"name"];
    }];
    XCTAssertNotNil(mapped);
    XCTAssertTrue([mapped isKindOfClass:[NSDictionary class]]);
    XCTAssertEqualObjects(mapped[@"134"], @"Cecilia");
    XCTAssertEqualObjects(mapped[@"153"], @"Tobias");
    XCTAssertEqualObjects(mapped[@"93"], @"Emil");
}

@end
