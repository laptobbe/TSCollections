//
//  TSCollectionReduceTests.m
//  TSCollections
//
//  Created by Tobias Sundstrand on 2014-04-18.
//
//

#import <XCTest/XCTest.h>
#import "TSCollectionHigherOrderFunctions.h"

@interface TSCollectionReduceTests : XCTestCase

@end

@implementation TSCollectionReduceTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testReduceOrderedSet {
    NSOrderedSet *set = [NSOrderedSet orderedSetWithArray:@[@{@"age": @53}, @{@"age": @46}, @{@"age" : @57}]];
   CGFloat total = [TSCollectionHigherOrderFunctions reduce:set withBlock:^CGFloat(NSDictionary *object) {
       return [[object objectForKey:@"age"] floatValue];
   }];
    XCTAssertEqual(total, 156.f);
}

- (void)testReduceSet {
    NSSet *set = [NSSet setWithArray:@[@{@"age": @53}, @{@"age": @46}, @{@"age" : @57}]];
    CGFloat total = [TSCollectionHigherOrderFunctions reduce:set withBlock:^CGFloat(NSDictionary *object) {
        return [[object objectForKey:@"age"] floatValue];
    }];
    XCTAssertEqual(total, 156.f);
}

- (void)testReduceArray {
    NSArray *set = @[@{@"age": @53}, @{@"age": @46}, @{@"age" : @57}];
    CGFloat total = [TSCollectionHigherOrderFunctions reduce:set withBlock:^CGFloat(NSDictionary *object) {
        return [[object objectForKey:@"age"] floatValue];
    }];
    XCTAssertEqual(total, 156.f);
}

@end
