//
// Created by Tobias Sundstrand on 2014-03-07.
//

#import "NSMutableArray+TSStack.h"

@implementation NSMutableArray (TSStack)

- (void)push:(id)object {
    if (object == nil) {
        [NSException raise:NSInternalInconsistencyException format:@"Can't push nil object"];
    }
    @synchronized (self) {
        [self addObject:object];
    }
}

- (id)peek{
    @synchronized (self) {
        return self.lastObject;
    }
}

- (id)pop {
    @synchronized (self) {
        id object = self.lastObject;
        [self removeLastObject];
        return object;
    }
}

- (NSUInteger)count {
    @synchronized (self) {
        return self.count;
    }
}

- (BOOL)isEmpty {
    return self.count == 0;
}


- (void)clear {
    @synchronized (self) {
        [self removeAllObjects];
    }
}
@end