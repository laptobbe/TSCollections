//
// Created by Tobias Sundstrand on 2014-03-11.
//

#import "NSMutableArray+TSQueue.h"

@implementation NSMutableArray (TSQueue)


- (void)enqueue:(id)object {
    if (!object) {
        [NSException raise:NSInternalInconsistencyException format:@"Can't enqueue nil objects"];
    }

    @synchronized (self) {
        [self addObject:object];
    }
}

- (id)dequeue {
    @synchronized (self) {
        id object = [self firstObject];
        if (object) {
            [self removeObject:object];
        }
        return object;
    }
}

- (id)peek {
    @synchronized (self) {
        return [self firstObject];
    }
}

- (void)clear {
    @synchronized (self) {
        [self removeAllObjects];
    }
}

- (BOOL)isEmpty {
    return self.count == 0;
}


@end