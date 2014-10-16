//
//  TSQueueTests.m
//  TSCollections
//
//  Created by Tobias Sundstrand on 2014-03-11.
//
//

#import <XCTest/XCTest.h>
#import "NSMutableArray+TSQueue.h"

@interface TSQueueTests : XCTestCase

@property(strong) NSMutableArray *queue;

@end

@implementation TSQueueTests

- (void)setUp {
    [super setUp];
    self.queue = [NSMutableArray new];
}

- (void)tearDown {
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testEnqueue {
    [self.queue enqueue:@3];
    XCTAssertEqual(self.queue.count, 1U);
}

- (void)testDequeue {
    [self.queue enqueue:@3];

    XCTAssertEqualObjects([self.queue dequeue], @3);
    XCTAssertEqual(self.queue.count, 0U);
}

- (void)testDequeueCorrectOrder {
    [self.queue enqueue:@1];
    [self.queue enqueue:@2];

    XCTAssertEqual(self.queue.count, 2U);
    XCTAssertEqualObjects([self.queue dequeue], @1);
    XCTAssertEqual(self.queue.count, 1U);
    XCTAssertEqualObjects([self.queue dequeue], @2);
    XCTAssertEqual(self.queue.count, 0U);
}

- (void)testClear {
    [self.queue enqueue:@1];
    [self.queue enqueue:@2];
    [self.queue clear];

    XCTAssertEqual(self.queue.count, 0U);
}

- (void)testIsEmpty {
    XCTAssertTrue(self.queue.isEmpty);
    [self.queue enqueue:@1];
    XCTAssertFalse(self.queue.isEmpty);
    [self.queue dequeue];
    XCTAssertTrue(self.queue.isEmpty);
}

- (void)testConvenienceWithArray {
    self.queue = [@[@1, @2, @3] mutableCopy];
    XCTAssertEqual(self.queue.count, 3U);
    XCTAssertEqualObjects([self.queue dequeue], @1);
    XCTAssertEqualObjects([self.queue dequeue], @2);
    XCTAssertEqualObjects([self.queue dequeue], @3);
}

- (void)testEqualityOneObject {
    [self.queue enqueue:@43];
    XCTAssertEqualObjects(self.queue, @[@43]);
}

- (void)testEqualityTwoObjects {
    [self.queue enqueue:@43];
    [self.queue enqueue:@46];
    NSArray *testQueue = @[@43, @46];
    XCTAssertEqualObjects(self.queue, testQueue);
}

- (void)testEqualityTwoObjectsDifferentOrder {
    [self.queue enqueue:@46];
    [self.queue enqueue:@43];
    NSArray *testQueue =  @[@43, @46];
    XCTAssertNotEqualObjects(self.queue, testQueue);
}

- (void)testAddingNilShouldThrow {
    XCTAssertThrowsSpecificNamed([self.queue enqueue:nil], NSException , NSInternalInconsistencyException);
}

- (void)testPeekingQueue {
    [self.queue enqueue:@45];
    [self.queue enqueue:@46];
    XCTAssertEqualObjects(@45, [self.queue first]);
}
@end
