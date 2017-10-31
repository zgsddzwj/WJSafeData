//
//  NSArray+RuntimeSafe.h
//  WJSafeData
//
//  Created by AdwardGreen on 2017/8/28.
//  Copyright © 2017年 WangJian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (RuntimeSafe)

/********直接对NSArray操作，移除其中的元素*********/


/** NSArray移除某个元素 */
- (NSArray *)arrayBySafeRemoveObject:(id)object;

/** NSArray移除某些元素 */
- (NSArray *)arrayBySafeRemoveObjectsFromArray:(NSArray *)removeArray;

@end
