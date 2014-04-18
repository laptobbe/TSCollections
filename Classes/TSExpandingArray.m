//
// Created by Tobias Sundstrand on 2014-03-24.
//

#import "TSExpandingArray.h"

@interface TSExpandingArray ()

@property(assign) Class fillOutClass;
@property(strong) NSMutableArray *backingArray;

@end

@implementation TSExpandingArray

+ (void)load {
    [TSCollectionOperations addCollectionOperationsToClass:[self class]];
}

+ (instancetype)arrayWithSize:(NSUInteger)size {
    return [[TSExpandingArray alloc] initWithSize:size];
}

+ (instancetype)arrayWithSize:(NSUInteger)size fillOutClass:(Class)class {
    return [[TSExpandingArray alloc] initWithSize:size fillOutClass:class];
}


- (instancetype)initWithSize:(NSUInteger)size fillOutClass:(Class)class {
    self = [super init];
    if (self) {
        _fillOutClass = class;
        _backingArray = [self arrayByExpandingArray:[NSMutableArray array] toSize:size withClass:class];
    }
    return self;
}

- (instancetype)initWithSize:(NSUInteger)size {
    return [self initWithSize:size fillOutClass:[NSNull class]];
}

- (instancetype)init {
    return [self initWithSize:0];
}

- (instancetype)initWithArray:(NSArray *)array {
    self = [self init];
    if (self) {
        _backingArray = [array mutableCopy];
    }
    return self;
}

- (NSUInteger)count {
    return self.backingArray.count;
}


- (id)objectAtIndex:(NSUInteger)idx {
    [self expandIfNecessaryToSize:idx + 1];
    return self.backingArray[idx];
}

- (void)setObject:(id)obj atIndex:(NSUInteger)idx {
    [self expandIfNecessaryToSize:idx + 1];
    self.backingArray[idx] = obj;
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx {
    return [self objectAtIndex:idx];
}

- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    [self setObject:obj atIndex:idx];
}

#pragma mark -
#pragma mark Expanding
- (void)expandIfNecessaryToSize:(NSUInteger)idx {
    if (self.backingArray.count < idx) {
        [self expandArray:self.backingArray toSize:idx withClass:self.fillOutClass];
    }
}

- (void)expandArray:(NSMutableArray *)array toSize:(NSUInteger)size withClass:(Class)class {
    while (array.count < size) {
        [array addObject:[class new]];
    }
}

- (NSMutableArray *)arrayByExpandingArray:(NSMutableArray *)array toSize:(NSUInteger)size withClass:(Class)class {
    [self expandArray:array toSize:size withClass:class];
    return array;
}

- (BOOL)isEqual:(TSExpandingArray *)other {
    return [other isKindOfClass:[TSExpandingArray class]] && [self.backingArray isEqual:other.backingArray];
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained [])buffer count:(NSUInteger)len {
    return [self.backingArray countByEnumeratingWithState:state objects:buffer count:len];
}

@end