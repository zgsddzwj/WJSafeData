//
//  NSDictionary+RuntimeSafe.h
//  WJSafeData
//
//  Created by AdwardGreen on 2017/8/28.
//  Copyright © 2017年 WangJian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (RuntimeSafe)

/********便捷value提取，直接拿到想要的数据类型*********/

/** 返回string或nil */
- (NSString *)safe_stringForKey:(id)key;

/** 返回array或nil */
- (NSArray *)safe_arrayForKey:(id)key;

/** 返回dictionary或nil */
- (NSDictionary *)safe_dictionaryForKey:(id)key;

/** 返回number或nil */
- (NSNumber *)safe_numberForKey:(id)key;


@end
