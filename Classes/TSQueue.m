//
// Created by Tobias Sundstrand on 2014-03-11.
//

#import "TSQueue.h"

@interface TSQueue ()

@property(nonatomic, strong) NSMutableArray *backingArray;

@end

@implementation TSQueue

- (instancetype)initWithObjects:(NSArray *)objects {
    self = [super init];
    if (self) {
        self.backingArray = [objects mutableCopy];
    }
    return self;
}

+ (instancetype)queue {
    return [[TSQueue alloc] init];
}

+ (instancetype)queueWithObjects:(NSArray *)objects {
    return [[TSQueue alloc] initWithObjects:objects];
}

- (NSMutableArray *)backingArray {
    if (!_backingArray) {
        _backingArray = [[NSMutableArray alloc] init];
    }
    return _backingArray;
}

- (BOOL)isEmpty {
    @synchronized (self) {
        return self.backingArray.count == 0;
    }
}

- (void)enqueue:(id)object {
    if (!object) {
        [NSException raise:NSInternalInconsistencyException format:@"Can't enqueue nil objects"];
    }

    @synchronized (self) {
        [self.backingArray addObject:object];
    }
}

- (id)dequeue {
    @synchronized (self) {
        id object = [self.backingArray firstObject];
        if (object) {
            [self.backingArray removeObject:object];
        }
        return object;
    }
}

- (NSUInteger)count {
    @synchronized (self) {
        return self.backingArray.count;
    }
}

- (void)clear {
    @synchronized (self) {
        [self.backingArray removeAllObjects];
    }
}

- (BOOL)isEqual:(TSQueue *)object {
    @synchronized (self) {
        return [object isKindOfClass:[TSQueue class]] && [self.backingArray isEqualToArray:object.backingArray];
    }
}

@end