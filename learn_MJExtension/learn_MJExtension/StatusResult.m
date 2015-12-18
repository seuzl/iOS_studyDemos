//
//  StatusResult.m
//  learn_MJExtension
//
//  Created by 赵磊 on 15/12/17.
//  Copyright © 2015年 赵磊. All rights reserved.
//

#import "StatusResult.h"
#import "MJExtension.h"

@implementation StatusResult

//指明数组中元素的类型（自定义类型）
//场景：model数组中套model
+(NSDictionary*) mj_objectClassInArray{
    return @{
             @"statuses":@"Status",
             @"ads":@"Ad"
             };
}

@end
