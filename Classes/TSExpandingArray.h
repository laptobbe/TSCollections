//
// Created by Tobias Sundstrand on 2014-03-24.
//

#import <Foundation/Foundation.h>

@interface TSExpandingArray : NSObject <NSFastEnumeration>

- (NSUInteger)count;

- (id)initWithSize:(NSUInteger)size;

- (id)objectAtIndex:(NSUInteger)idx;

- (id)initWithSize:(NSUInteger)size fillOutClass:(Class)class;

- (instancetype)initWithArray:(NSArray *)array;

+ (instancetype)arrayWithSize:(NSUInteger)size;

+ (instancetype)arrayWithSize:(NSUInteger)size fillOutClass:(Class)class;

- (void)setObject:(id)obj atIndex:(NSUInteger)idx;

- (id)objectAtIndexedSubscript:(NSUInteger)idx;

- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx;

- (NSArray *)allObjects;

- (void)removeAllObjects;

- (void)removeObjectAtIndex:(NSUInteger)index;
@end
