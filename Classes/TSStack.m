//
// Created by Tobias Sundstrand on 2014-03-07.
//

#import "TSStack.h"

@interface TSStack ()

@property(nonatomic, strong) NSMutableArray *internalArray;

@end

@implementation TSStack

+ (TSStack *)stackWithObjects:(NSArray *)objects {
    return [[TSStack alloc] initWithObjects:objects];
}

+ (TSStack *)stack {
    return [[TSStack alloc] init];
}

- (id)initWithObjects:(NSArray *)objects {
    self = [super init];
    if (self) {
        _internalArray = [objects mutableCopy];
    }
    return self;
}

- (NSMutableArray *)internalArray {
    if (!_internalArray) {
        _internalArray = [NSMutableArray array];
    }
    return _internalArray;
}

- (void)push:(id)object {
    if (object == nil) {
        [NSException raise:NSInternalInconsistencyException format:@"Can't push nil object"];
    }
    @synchronized (self) {
        [self.internalArray addObject:object];
    }
}



- (id)peek {
    @synchronized (self) {
        return self.internalArray.lastObject;
    }
}

- (id)pop {
    @synchronized (self) {
        id object = [self.internalArray lastObject];
        [self.internalArray removeLastObject];
        return object;
    }
}

- (NSUInteger)count {
    @synchronized (self) {
        return self.internalArray.count;
    }
}

- (BOOL)isEmpty {
    return self.count == 0;
}

- (BOOL)isEqual:(TSStack *)object {
    @synchronized (self) {
        return [object isKindOfClass:[TSStack class]] && [self.internalArray isEqual:object.internalArray];
    }
}

- (void)clear {
    @synchronized (self) {
        [self.internalArray removeAllObjects];
    }
}
@end