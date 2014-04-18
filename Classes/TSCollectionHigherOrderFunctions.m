//
// Created by Tobias Sundstrand on 2014-04-18.
//

#import "TSCollectionHigherOrderFunctions.h"
#import <objc/runtime.h>


@implementation TSCollectionHigherOrderFunctions

typedef enum {
    TSCollectionTypeVector = 0,
    TSCollectionTypeKeyValue
} TSCollectionType;

+ (TSCollectionType)collectionTypeForCollection:(id)collection {
    if ([collection respondsToSelector:@selector(objectForKey:)]) {
        return TSCollectionTypeKeyValue;
    } else {
        return TSCollectionTypeVector;
    }
}

+ (id)filter:(id <NSFastEnumeration>)collection withBlock:(TSFilterBlock)block {
    if ([self collectionTypeForCollection:collection] == TSCollectionTypeKeyValue) {
        return [self filter:collection asKeyValueWithBlock:block];
    } else {
        return [self filter:collection asVectorWithBlock:block];
    }
}

+ (id)filter:(id <NSFastEnumeration>)collection asKeyValueWithBlock:(TSFilterBlock)block {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    for (id key in collection) {
        if (block(key)) {
            [dictionary setObject:collection[key] forKey:key];
        }
    }
    return [self convertResult:dictionary toClassOfObject:collection];
}

+ (id)filter:(id <NSFastEnumeration>)collection asVectorWithBlock:(TSFilterBlock)block {
    NSMutableArray *array = [NSMutableArray array];
    for (id object in collection) {
        if (block(object)) {
            [array addObject:object];
        }
    }
    return [self convertResult:array toClassOfObject:collection];
}

+ (id)map:(id <NSFastEnumeration>)collection withBlock:(TSMapBlock)block {
    if ([self collectionTypeForCollection:collection] == TSCollectionTypeKeyValue) {
        return [self map:collection asKeyValueWithBlock:block];
    } else {
        return [self map:collection asVectorWithBlock:block];
    }
}

+ (id)map:(id <NSFastEnumeration>)collection asKeyValueWithBlock:(TSMapBlock)block {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    for (id key in collection) {
        id mapped = block(key);
        if (mapped) {
            [dictionary setObject:mapped forKey:key];
        }
    }
    return [self convertResult:dictionary toClassOfObject:collection];
}

+ (id)map:(id <NSFastEnumeration>)collection asVectorWithBlock:(TSMapBlock)block {
    NSMutableArray *array = [NSMutableArray array];
    for (id object in collection) {
        id mapped = block(object);
        if (mapped) {
            [array addObject:mapped];
        }
    }
    return [self convertResult:array toClassOfObject:collection];
}


+ (double)reduce:(id <NSFastEnumeration>)collection withBlock:(TSReduceBlock)block {
    CGFloat result = 0;
    for (id object in collection) {
        result += block(object);
    }
    return result;
}

+ (id)convertResult:(id)result toClassOfObject:(id)object {
    if ([object respondsToSelector:@selector(initWithArray:)]) {
        return [[[object class] alloc] initWithArray:result];
    } else if ([object respondsToSelector:@selector(initWithDictionary:)]) {
        return [[[object class] alloc] initWithDictionary:result];
    }
    return result;
}

+ (void)load {
    [self addHigherOrderFunctionsToClasses:@[
            [NSArray class],
            [NSSet class],
            [NSDictionary class],
            [NSOrderedSet class],
    ]];
}

id filterWithBlock(id self, SEL _cmd, TSFilterBlock block) {
    return [TSCollectionHigherOrderFunctions filter:self withBlock:block];
}

id mapWithBlock(id self, SEL _cmd, TSMapBlock block) {
    return [TSCollectionHigherOrderFunctions map:self withBlock:block];
}

double reduceWithBlock(id self, SEL _cmd, TSReduceBlock block) {
    return [TSCollectionHigherOrderFunctions reduce:self withBlock:block];
}

+ (void)addHigherOrderFunctionsToClasses:(NSArray *)array {
    for (Class class in array) {
        class_addMethod(class, @selector(filterWithBlock:), (IMP) filterWithBlock, "@@:@");
        class_addMethod(class, @selector(mapWithBlock:), (IMP) mapWithBlock, "@@:@");
        class_addMethod(class, @selector(reduceWithBlock:), (IMP) reduceWithBlock, "d@:@");
    }
}


@end

