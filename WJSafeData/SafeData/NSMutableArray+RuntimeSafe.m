//
//  NSMutableArray+RuntimeSafe.m
//  WJSafeData
//
//  Created by AdwardGreen on 2017/8/28.
//  Copyright © 2017年 WangJian. All rights reserved.
//

#import "NSMutableArray+RuntimeSafe.h"
#import "NSObject+SafeChange.h"

@implementation NSMutableArray (RuntimeSafe)

+(void)load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self SwizzlingMethod:@"addObject:" systemClassString:@"__NSArrayM" toSafeMethodString:@"wj_addObject:" targetClassString:@"NSMutableArray"];

        [self SwizzlingMethod:@"addObjectsFromArray:" systemClassString:@"__NSArrayM" toSafeMethodString:@"wj_addObjectsFromArray:" targetClassString:@"NSMutableArray"];

        [self SwizzlingMethod:@"insertObject:atIndex:" systemClassString:@"__NSArrayM" toSafeMethodString:@"wj_insertObject:atIndex:" targetClassString:@"NSMutableArray"];

        [self SwizzlingMethod:@"removeObjectAtIndex:" systemClassString:@"__NSArrayM" toSafeMethodString:@"wj_removeObjectAtIndex:" targetClassString:@"NSMutableArray"];

        [self SwizzlingMethod:@"replaceObjectAtIndex:withObject:" systemClassString:@"__NSArrayM" toSafeMethodString:@"wj_safe_replaceObjectAtIndex:withObject:" targetClassString:@"NSMutableArray"];

        [self SwizzlingMethod:@"removeObjectsAtIndexes:" systemClassString:@"NSMutableArray" toSafeMethodString:@"wj_removeObjectsAtIndexes:" targetClassString:@"NSMutableArray"];

        [self SwizzlingMethod:@"removeObjectsInRange:" systemClassString:@"NSMutableArray" toSafeMethodString:@"wj_removeObjectsInRange:" targetClassString:@"NSMutableArray"];

        [self SwizzlingMethod:@"objectAtIndex:" systemClassString:@"__NSArrayM" toSafeMethodString:@"wj_objectAtIndex:" targetClassString:@"NSMutableArray"];

    });

}

- (void)wj_addObject:(id)anObject{
    if (!anObject) {
        return;
    }
    [self wj_addObject:anObject];
}

- (void)wj_addObjectsFromArray:(NSArray *)array{
    if (!array || array.count <= 0) {
        return;
    }
    [self wj_addObjectsFromArray:array];
}

- (void)wj_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (index > [self count]) {
        return;
    }
    if (!anObject) {
        return;
    }
    [self wj_insertObject:anObject atIndex:index];
}
- (void)wj_removeObjectAtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        return;
    }

    return [self wj_removeObjectAtIndex:index];
}
- (void)safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (index >= [self count]) {
        return;
    }
    if (!anObject) {
        return;
    }
    [self safe_replaceObjectAtIndex:index withObject:anObject];
}
- (void)wj_removeObjectsAtIndexes:(NSIndexSet *)indexes{
    NSMutableIndexSet * mutableSet = [NSMutableIndexSet indexSet];
    [indexes enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx < [self count ]) {
            [mutableSet addIndex:idx];
        }
    }];
    [self wj_removeObjectsAtIndexes:mutableSet];
}
- (void)wj_removeObjectsInRange:(NSRange)range{
    //获取最大索引
    if (range.location + range.length - 1 < [self count]) {
        [self wj_removeObjectsInRange:range];
        return;
    }
    if (range.location >= [self count]) {
        return;
    }
    NSInteger tempInteger = range.location + range.length - 1;
    while (tempInteger >= [self count]) {
        tempInteger -= 1;
    }
    NSRange tempRange = NSMakeRange(range.location, tempInteger + 1 -range.location);
    [self wj_removeObjectsInRange:tempRange];
}
- (id)wj_objectAtIndex:(NSUInteger)index{
    //判断数组是否越界
    if (index >= [self count]) {
        return nil;
    }
    return [self wj_objectAtIndex:index];
}

@end
