//
// Created by Tobias Sundstrand on 2014-03-07.
//

#import <Foundation/Foundation.h>


@interface TSStack : NSObject

@property(readonly) BOOL isEmpty;
@property(readonly) NSUInteger count;
@property(readonly) id pop;
@property(readonly) id peek;

- (void)push:(id)object;

+ (TSStack *)stack;

@end