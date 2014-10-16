//
//  TSStackTests.m
//  TSAsyncTesting
//
//  Created by Tobias Sundstrand on 2014-03-07.
//
//

#import <XCTest/XCTest.h>
#import "NSMutableArray+TSStack.h"
#import "TSAsyncTesting.h"

@interface TSStackTests : XCTestCase

@property(nonatomic, strong) NSMutableArray *stack;

@end

@implementation TSStackTests

- (void)setUp {
    [super setUp];
    self.stack = [NSMutableArray new];
}

- (void)testPushingNumber {
    [self.stack push:@2];
    XCTAssertEqual(self.stack.count, 1U);
}

- (void)testPushingTwoNumbers {
    [self.stack push:@2];
    [self.stack push:@3];
    XCTAssertEqual(self.stack.count, 2U);
}

- (void)testPushingStringAndNumber {
    [self.stack push:@1];
    [self.stack push:@"two"];
    XCTAssertEqual(self.stack.count, 2U);
}

- (void)testPeekOneItem {
    [self.stack push:@2];
    XCTAssertEqualObjects([self.stack peek], @2);
    XCTAssertEqual(self.stack.count, 1U);
}

- (void)testPeekTwoItems {
    [self.stack push:@2];
    [self.stack push:@3];
    XCTAssertEqualObjects([self.stack peek], @3);
    XCTAssertEqual(self.stack.count, 2U);
}

- (void)testPeekThreeItems {
    [self.stack push:@4];
    [self.stack push:@8];
    [self.stack push:@1];
    XCTAssertEqualObjects([self.stack peek], @1);
    XCTAssertEqual(self.stack.count, 3U);
}

- (void)testPopOneItem {
    [self.stack push:@2];
    XCTAssertEqual(self.stack.count, 1U);
    XCTAssertEqualObjects([self.stack pop], @2);
    XCTAssertEqual(self.stack.count, 0U);
}

- (void)testPopTwoItems {
    [self.stack push:@2];
    [self.stack push:@3];
    XCTAssertEqual(self.stack.count, 2U);
    XCTAssertEqualObjects([self.stack pop], @3);
    XCTAssertEqual(self.stack.count, 1U);
    XCTAssertEqualObjects([self.stack pop], @2);
    XCTAssertEqual(self.stack.count, 0U);
}

- (void)testIsEmptyNoItems {
    XCTAssertTrue(self.stack.isEmpty);
}

- (void)testIsEmptyOneItem {
    [self.stack push:@"h"];
    XCTAssertFalse(self.stack.isEmpty);
}

- (void)testIsEmptyAfterPop {
    [self.stack push:@"h"];
    [self.stack pop];
    XCTAssertTrue(self.stack.isEmpty);
}

- (void)testIsEqualOneItem {
    [self.stack push:@2];
    XCTAssertEqualObjects(@[@2], self.stack);
}

- (void)testIsEqualTwoItems {
    [self.stack push:@2];
    [self.stack push:@4];
    NSArray *testArray = @[@2,@4];
    XCTAssertEqualObjects(self.stack, testArray);
}

- (void)testIsNotEqualTwoItems {
    [self.stack push:@2];
    [self.stack push:@4];
    NSArray *testArray = @[@2, @3];
    XCTAssertNotEqualObjects(self.stack, testArray);
}

- (void)testDifferentObjects {
    BOOL equal = YES;
    XCTAssertNoThrow(equal = [self.stack isEqual:@"t"]);
    XCTAssertFalse(equal);
}

- (void)testPushingNil {
    XCTAssertThrowsSpecificNamed([self.stack push:nil], NSException, NSInternalInconsistencyException);
    XCTAssertEqual(self.stack.count, 0U);
}

- (void)testPopingEmptyStack {
    XCTAssertNoThrow(self.stack.pop);
    XCTAssertNil(self.stack.pop);
}

- (void)testPeekEmptyStack {
    XCTAssertNoThrow([self.stack peek]);
}

- (void)testModifyingOnBackgroundQueue {
    [self.stack push:@1];
    [TSAsyncTesting testOnBackgroundQueue:^{
        XCTAssertNoThrow([self.stack push:@5]);
    }];
    XCTAssertEqual(self.stack.count, 2U);
}

- (void)testClearing {
    [self.stack push:@1];
    [self.stack push:@2];
    XCTAssertEqual(self.stack.count, 2U);
    [self.stack clear];
    XCTAssertEqual(self.stack.count, 0U);
}

- (void)testAddingAfterClearing {
    [self.stack push:@1];
    [self.stack push:@2];
    [self.stack clear];
    XCTAssertEqual(self.stack.count, 0U);
    [self.stack push:@3];
    XCTAssertEqual(self.stack.count, 1U);
}

- (void)testConvenienceCreateWithObjects {
    self.stack = [@[@1, @"2", @3] mutableCopy];
    XCTAssertNotNil(self.stack);
    XCTAssertEqual(self.stack.count, 3U);
    XCTAssertEqualObjects(self.stack.pop, @3);
    XCTAssertEqualObjects(self.stack.pop, @"2");
    XCTAssertEqualObjects(self.stack.pop, @1);
}

@end
