//
//  ViewController.m
//  WJSafeData
//
//  Created by AdwardGreen on 2017/8/28.
//  Copyright © 2017年 WangJian. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+RuntimeSafe.h"
#import "NSDictionary+RuntimeSafe.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSArray *arr = @[@"1"];
    NSLog(@"%@",arr[5]);
    NSLog(@"%@",[arr objectAtIndex:5]);
    arr = [arr arrayByAddingObjectsFromArray:@[]];

    arr = [arr arrayBySafeRemoveObject:nil];



    NSString *key1 = nil;
    NSString *value1 = nil;
    NSDictionary *dic = @{key1:value1};
    NSLog(@"%@\n%@",dic,[dic safe_arrayForKey:@"key"]);

    NSMutableArray *mutArr = [@[@"1",@"2",@"3"]mutableCopy];
    [mutArr insertObject:@"22" atIndex:5];
    NSLog(@"%@",mutArr);

    [mutArr addObjectsFromArray:@[]];

    NSMutableDictionary *mutDic = [@{@"key1":@"value"}mutableCopy];
    [mutDic removeObjectForKey:@"key"];
    [mutDic setValue:nil forKey:@"1"];
    NSLog(@"%@",mutDic);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
