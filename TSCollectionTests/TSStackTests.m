//
//  TSStackTests.m
//  TSAsyncTesting
//
//  Created by Tobias Sundstrand on 2014-03-07.
//
//

#import <XCTest/XCTest.h>
#import "TSStack.h"

@interface TSStackTests : XCTestCase

@property (nonatomic, strong) TSStack *stack;

@end

@implementation TSStackTests

- (void)setUp
{
    [super setUp];
    self.stack = [[TSStack alloc] init];
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

- (void)testConvenienceCreate {
    TSStack *stack1 = [TSStack stack];
    XCTAssertNotNil(stack1);
    XCTAssertTrue(stack1.isEmpty);
}

- (void)testIsEqualEmpty {
    TSStack *stack1 = [[TSStack alloc] init];
    XCTAssertEqualObjects(stack1, self.stack);
}

- (void)testIsEqualOneItem {
    TSStack *stack1 = [[TSStack alloc] init];
    [stack1 push:@2];
    [self.stack push:@2];
    XCTAssertEqualObjects(stack1, self.stack);
}

- (void)testIsEqualTwoItems {
    TSStack *stack1 = [[TSStack alloc] init];
    [stack1 push:@2];
    [stack1 push:@4];
    [self.stack push:@2];
    [self.stack push:@4];
    XCTAssertEqualObjects(stack1, self.stack);
}

- (void)testIsNotEqualTwoItems {
    TSStack *stack1 = [[TSStack alloc] init];
    [stack1 push:@2];
    [stack1 push:@3];
    [self.stack push:@2];
    [self.stack push:@4];
    XCTAssertNotEqualObjects(stack1, self.stack);
}

- (void)testDifferentObjects {
    BOOL equal = YES;
    XCTAssertNoThrow(equal = [self.stack isEqual:@"t"]);
    XCTAssertFalse(equal);
}

- (void)testPushingNil {
    XCTAssertNoThrow([self.stack push:nil]);
    XCTAssertEqual(self.stack.count, 1U);
    XCTAssertEqualObjects(self.stack.pop, [NSNull null]);
}

- (void)testPeekEmptyStack {
    XCTAssertNoThrow([self.stack peek]);
}

@end
