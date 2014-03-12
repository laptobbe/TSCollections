//
// Created by Tobias Sundstrand on 2014-03-11.
//

#import <Foundation/Foundation.h>

@interface TSQueue : NSObject

@property(readonly) NSUInteger count;
@property(readonly) BOOL isEmpty;

- (instancetype)initWithObjects:(NSArray *)objects;

+ (instancetype)queue;

+ (instancetype)queueWithObjects:(NSArray *)objects;

- (void)enqueue:(id)object;

- (id)dequeue;

- (void)clear;

@end