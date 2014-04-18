//
// Created by Tobias Sundstrand on 2014-04-18.
//

#import <Foundation/Foundation.h>

typedef BOOL (^TSFilterBlock)(id object);
typedef id (^TSMapBlock)(id object);
typedef CGFloat (^TSReduceBlock)(id object);

@interface TSCollectionHigherOrderFunctions : NSObject

+ (id)filter:(id <NSFastEnumeration>)collection withBlock:(TSFilterBlock)block;
+ (id)map:(id<NSFastEnumeration>)collection withBlock:(TSMapBlock)block;
+ (double)reduce:(id <NSFastEnumeration>)collection withBlock:(TSReduceBlock)block;

@end

@protocol TSCollectionHigherOrderFunctions

- (id)filterWithBlock:(TSFilterBlock)block;
- (id)mapWithBlock:(TSMapBlock)block;
- (CGFloat)reduceWithBlock:(TSReduceBlock)block;

@end

@interface NSArray (HigherOrderFunctions) <TSCollectionHigherOrderFunctions> @end
@interface NSSet (HigherOrderFunctions) <TSCollectionHigherOrderFunctions> @end
@interface NSDictionary (HigherOrderFunctions) <TSCollectionHigherOrderFunctions> @end
@interface NSOrderedSet (HigherOrderFunctions) <TSCollectionHigherOrderFunctions> @end
@interface NSPointerArray (HigherOrderFunctions) <TSCollectionHigherOrderFunctions> @end
@interface NSHashTable (HigherOrderFunctions) <TSCollectionHigherOrderFunctions> @end
@interface NSMapTable (HigherOrderFunctions) <TSCollectionHigherOrderFunctions> @end
