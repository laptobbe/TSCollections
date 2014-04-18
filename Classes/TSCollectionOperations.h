//
// Created by Tobias Sundstrand on 2014-04-18.
//

#import <Foundation/Foundation.h>

typedef BOOL (^TSFilterBlock)(id object);
typedef id (^TSMapBlock)(id object);
typedef double (^TSReduceBlock)(id object);

@interface TSCollectionOperations : NSObject

+ (id)filter:(id <NSFastEnumeration>)collection withBlock:(TSFilterBlock)block;
+ (id)map:(id<NSFastEnumeration>)collection withBlock:(TSMapBlock)block;
+ (double)reduce:(id <NSFastEnumeration>)collection withBlock:(TSReduceBlock)block;

@end

@protocol TSCollectionOperation

- (id)filterWithBlock:(TSFilterBlock)block;
- (id)mapWithBlock:(TSMapBlock)block;
- (CGFloat)reduceWithBlock:(TSReduceBlock)block;

@end

@interface NSArray (TSCollectionOperation) <TSCollectionOperation> @end
@interface NSSet (TSCollectionOperation) <TSCollectionOperation> @end
@interface NSDictionary (TSCollectionOperation) <TSCollectionOperation> @end
@interface NSOrderedSet (TSCollectionOperation) <TSCollectionOperation> @end
