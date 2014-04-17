//
// Created by Tobias Sundstrand on 2014-03-07.
//

#import <Foundation/Foundation.h>


@interface NSMutableArray (TSStack)

- (id)pop;

- (id)peek;

- (void)push:(id)object;

- (void)clear;

- (BOOL)isEmpty;


@end