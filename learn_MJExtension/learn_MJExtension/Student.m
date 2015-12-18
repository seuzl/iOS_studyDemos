//
//  Student.m
//  learn_MJExtension
//
//  Created by 赵磊 on 15/12/17.
//  Copyright © 2015年 赵磊. All rights reserved.
//

#import "Student.h"
#import "MJExtension.h"

@implementation Student

//指明可替换key
//场景:将自定义名称映射到api文档返回的名称（当二者不同时）

+(NSDictionary*) mj_replacedKeyFromPropertyName{
    return@{
            @"ID" : @"id",
            @"desc" : @"desciption",
            @"oldName" : @"name.oldName",
            @"nowName" : @"name.newName",
            @"nameChangedTime" : @"name.info[1].nameChangedTime",
            @"bag" : @"other.bag"
            };
}

@end
