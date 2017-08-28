//
//  NSArray+RuntimeSafe.m
//  WJSafeData
//
//  Created by AdwardGreen on 2017/8/28.
//  Copyright © 2017年 WangJian. All rights reserved.
//

#import "NSArray+RuntimeSafe.h"
#import "NSObject+SafeChange.h"

@implementation NSArray (RuntimeSafe)

+(void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self SwizzlingMethod:@"objectAtIndex:" systemClassString:@"__NSArrayI" toSafeMethodString:@"wj_objectAtIndex:" targetClassString:@"NSArray"];

        //如果当前数组只有一个元素，相应的是__NSSingleObjectArrayI
        [self SwizzlingMethod:@"objectAtIndex:" systemClassString:@"__NSSingleObjectArrayI" toSafeMethodString:@"wj_singleObjectAtIndex:" targetClassString:@"NSArray"];

        [self SwizzlingMethod:@"initWithObjects:count:" systemClassString:@"__NSPlaceholderArray" toSafeMethodString:@"initWithObjects_wj:count:" targetClassString:@"NSArray"];
        
        [self SwizzlingMethod:@"arrayByAddingObject:" systemClassString:@"__NSArrayI" toSafeMethodString:@"wj_arrayByAddingObject:" targetClassString:@"NSArray"];


    });
}

#pragma mark - runtime method exchange
- (id)wj_objectAtIndex:(NSUInteger)index{
    //判断数组是否越界
    if (index >= [self count]) {
        return nil;
    }
    return [self wj_objectAtIndex:index];
}

- (id)wj_singleObjectAtIndex:(NSUInteger)index{
    //判断数组是否越界
    if (index >= [self count]) {
        return nil;
    }
    return [self wj_singleObjectAtIndex:index];
}

- (NSArray *)wj_arrayByAddingObject:(id)anObject {
    if (!anObject) {
        return self;
    }
    return [self wj_arrayByAddingObject:anObject];
}


- (instancetype)initWithObjects_wj:(id *)objects count:(NSUInteger)count {
    NSUInteger newCount = 0;
    for (NSUInteger i = 0; i < count; i++) {
        if (!objects || !objects[i]) {
            break;
        }
        newCount++;
    }
    self = [self initWithObjects_wj:objects count:newCount];
    return self;
}

#pragma mark - safe method
- (NSArray *)arrayBySafeRemoveObject:(id)object; {
    NSArray *ret = self;
    if (object && (self.count > 0)) {
        NSMutableArray *tmp = [self mutableCopy];
        [tmp removeObject:object];
        ret = [NSArray arrayWithArray:tmp];
    }
    return (ret);
}


- (NSArray *)arrayBySafeRemoveObjectsFromArray:(NSArray *)removeArray; {
    NSArray *ret = self;
    if ((removeArray.count > 0) && (self.count > 0)){
        NSMutableArray *tmp = [self mutableCopy];
        [tmp removeObjectsInArray:removeArray];
        ret = [NSArray arrayWithArray:tmp];
    }
    return (ret);
}


@end
