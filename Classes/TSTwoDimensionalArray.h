//
// Created by Tobias Sundstrand on 2014-03-19.
//

#import <Foundation/Foundation.h>

@class TSExpandingArray;


@interface TSTwoDimensionalArray : NSObject

+ (TSTwoDimensionalArray *)array;

- (void)setObject:(id)object atRow:(NSUInteger)row column:(NSUInteger)column;

- (id)objectAtRow:(NSUInteger)row column:(NSUInteger)column;

- (TSExpandingArray *)objectsAtRow:(NSUInteger)value;

- (TSExpandingArray *)objectsAtColumn:(NSUInteger)value;

- (TSExpandingArray *)objectAtIndexedSubscript:(NSInteger)idx;

- (NSUInteger)rowCount;

- (NSUInteger)columnCount;

- (void)removeAllObjects;

@end
