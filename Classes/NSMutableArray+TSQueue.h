//
// Created by Tobias Sundstrand on 2014-03-11.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (TSQueue)

- (void)enqueue:(id)object;

- (id)dequeue;

- (id)peek;

- (void)clear;

- (BOOL)isEmpty;
@end