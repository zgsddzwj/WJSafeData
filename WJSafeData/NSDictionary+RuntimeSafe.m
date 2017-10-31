//
//  NSDictionary+RuntimeSafe.m
//  WJSafeData
//
//  Created by AdwardGreen on 2017/8/28.
//  Copyright © 2017年 WangJian. All rights reserved.
//

#import "NSDictionary+RuntimeSafe.h"
#import "NSObject+SafeChange.h"

@implementation NSDictionary (RuntimeSafe)

+ (void)load{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self SwizzlingMethod:@"initWithObjects:forKeys:count:" systemClassString:@"__NSPlaceholderDictionary" toSafeMethodString:@"initWithObjects_wj:forKeys:count:" targetClassString:@"NSDictionary"];
    });

}

#pragma mark - runtime method exchange
-(instancetype)initWithObjects_wj:(id *)objects forKeys:(id<NSCopying> *)keys count:(NSUInteger)count {
    NSUInteger rightCount = 0;
    for (NSUInteger i = 0; i < count; i++) {
        if (!(keys[i] && objects[i])) {
            break;
        }else{
            rightCount++;
        }
    }
    self = [self initWithObjects_wj:objects forKeys:keys count:rightCount];
    return self;
}

#pragma mark - safe method

- (NSString *)safe_stringForKey:(id)key;{
    if (!key) return nil;
    id ret = [self objectForKey:key];
    if ([ret isKindOfClass:[NSString class]]){
        return ((NSString *)ret);
    }
    return (nil);
}
- (NSArray *)safe_arrayForKey:(id)key;{
    if (!key) return nil;
    id ret = [self objectForKey:key];
    if ([ret isKindOfClass:[NSArray class]]){
        return ((NSArray *)ret);
    }
    return (nil);
}

- (NSDictionary *)safe_dictionaryForKey:(id)key;{
    if (!key) return nil;
    id ret = [self objectForKey:key];
    if ([ret isKindOfClass:[NSDictionary class]]){
        return ((NSDictionary *)ret);
    }
    return (nil);
}

- (NSNumber *)safe_numberForKey:(id)key;{
    if (!key) return nil;
    id ret = [self objectForKey:key];
    if ([ret isKindOfClass:[NSNumber class]]){
        return ((NSNumber *)ret);
    }
    return (nil);
}


@end
