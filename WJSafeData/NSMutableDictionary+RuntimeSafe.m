//
//  NSMutableDictionary+RuntimeSafe.m
//  WJSafeData
//
//  Created by AdwardGreen on 2017/8/28.
//  Copyright © 2017年 WangJian. All rights reserved.
//

#import "NSMutableDictionary+RuntimeSafe.h"
#import "NSObject+SafeChange.h"

@implementation NSMutableDictionary (RuntimeSafe)

+(void)load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self SwizzlingMethod:@"st_removeObjectForKey:" systemClassString:@"NSMutableDictionary" toSafeMethodString:@"removeObjectForKey:" targetClassString:@"__NSDictionaryM"];
        [self SwizzlingMethod:@"st_setObject:forKey:" systemClassString:@"NSMutableDictionary" toSafeMethodString:@"setObject:forKey:" targetClassString:@"__NSDictionaryM"];
    });

}

- (void)wj_removeObjectForKey:(id)key {
    if (!key) {
        return;
    }
    [self wj_removeObjectForKey:key];
}
- (void)wj_setObject:(id)obj forKey:(id <NSCopying>)key {
    if (!obj) {
        return;
    }
    if (!key) {
        return;
    }
    [self wj_setObject:obj forKey:key];
}

@end
