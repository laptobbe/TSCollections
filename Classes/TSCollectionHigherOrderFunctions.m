//
// Created by Tobias Sundstrand on 2014-04-18.
//

#import "TSCollectionHigherOrderFunctions.h"
#import <objc/runtime.h>



@implementation TSCollectionHigherOrderFunctions


+ (id)filter:(id <NSFastEnumeration>)collection withBlock:(TSFilterBlock)block {
    return [TSCollectionHigherOrderFunctions map:collection withBlock:^id(id object) {
        return block(object) ? object : nil;
    }];
}

+ (id)map:(id <NSFastEnumeration>)collection withBlock:(TSMapBlock)block {
    NSMutableArray *result = [NSMutableArray array];
    for (id object in collection) {
        id mapped = block(object);
        if (mapped) {
            [result addObject:block(object)];
        }
    }
    return [self convertArray:result toClassOfObject:collection];
}

+ (double)reduce:(id <NSFastEnumeration>)collection withBlock:(TSReduceBlock)block {
    CGFloat result = 0;
    for (id object in collection) {
        result += block(object);
    }
    return result;
}


+ (id)convertArray:(NSArray *)array toClassOfObject:(id)object {
    if([object respondsToSelector:@selector(initWithArray:)]){
        return [[[object class] alloc] initWithArray:array];
    }
    return array;
}

+ (void)load {
    [self addHigherOrderFunctionsToClasses:@[
            [NSArray class],
            [NSSet class],
            [NSDictionary class],
            [NSOrderedSet class],
            [NSPointerArray class],
            [NSHashTable class],
            [NSMapTable class]
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

