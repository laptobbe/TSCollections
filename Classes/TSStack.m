//
// Created by Tobias Sundstrand on 2014-03-07.
//

#import "TSStack.h"

@interface TSStack ()

@property (strong) NSMutableArray *internalArray;

@end

@implementation TSStack

- (NSMutableArray *)internalArray {
    if (!_internalArray) {
        _internalArray = [NSMutableArray array];
    }
    return _internalArray;
}

+ (TSStack *)stack {
    return [[TSStack alloc] init];
}

- (void)push:(id)object {
    if (!object) {
        object = [NSNull null];
    }
    [self.internalArray addObject:object];
}

- (id)peek {
    return self.internalArray.lastObject;
}

- (id)pop {
    id object = [self.internalArray lastObject];
    [self.internalArray removeLastObject];
    return object;
}

- (NSUInteger)count {
    return self.internalArray.count;
}

- (BOOL)isEmpty {
    return self.count == 0;
}

- (BOOL)isEqual:(TSStack *)object {
    if(![object isKindOfClass:[TSStack class]]) {
        return NO;
    }
    return [self.internalArray isEqual:object.internalArray];
}

@end