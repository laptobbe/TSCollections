//
// Created by Tobias Sundstrand on 2014-03-19.
//

#import "TSTwoDimensionalArray.h"
#import "TSExpandingArray.h"

@interface TSTwoDimensionalArray ()

@property(strong) TSExpandingArray *rows;
@property(strong) TSExpandingArray *columns;

@end

@implementation TSTwoDimensionalArray

- (id)init {
    self = [super init];
    if (self) {
        _rows = [TSExpandingArray arrayWithSize:0 fillOutClass:[TSExpandingArray class]];
        _columns = [TSExpandingArray arrayWithSize:0 fillOutClass:[TSExpandingArray class]];
    }
    return self;
}

- (id)objectAtRow:(NSUInteger)row column:(NSUInteger)column {
    return self.rows[row][column];
}

- (void)setObject:(id)object atRow:(NSUInteger)row column:(NSUInteger)column {
    [self setObject:object atX:row y:column inArray:self.rows];
    [self setObject:object atX:column y:row inArray:self.columns];
}

- (void)setObject:(id)object atX:(NSUInteger)x y:(NSUInteger)y inArray:(TSExpandingArray *)array {
    TSExpandingArray *xArray = array[x];
    if (!xArray) {
        xArray = [TSExpandingArray arrayWithSize:y + 1];
    }
    xArray[y] = object;
    array[x] = xArray;
}

+ (TSTwoDimensionalArray *)array {
    return [[TSTwoDimensionalArray alloc] init];
}

- (TSExpandingArray *)objectsAtRow:(NSUInteger)value {
    return self.rows[value];
}

- (TSExpandingArray *)objectsAtColumn:(NSUInteger)value {
    return self.columns[value];
}

- (BOOL)isEqual:(TSTwoDimensionalArray *)other {
    return [other isKindOfClass:[TSTwoDimensionalArray class]] && [self.rows isEqual:other.rows];
}

- (TSExpandingArray *)objectAtIndexedSubscript:(NSInteger)idx {
    return [self objectsAtRow:idx];
}

- (void)removeObjectAtRow:(NSUInteger)row column:(NSUInteger)column {
    [self setObject:[NSNull null] atRow:row column:column];
}

- (void)removeRow:(NSUInteger)row {
    for (int column = 0; column < self.columns.count; column++) {
        [self setObject:[NSNull null] atRow:row column:column];
    }
}

- (void)removeColumn:(NSUInteger)column {
    for (int row = 0; row < self.rows.count; row++) {
        [self setObject:[NSNull null] atRow:row column:column];
    }
}
@end
