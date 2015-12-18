//
//  Dog.m
//  learn_MJExtension
//
//  Created by 赵磊 on 15/12/17.
//  Copyright © 2015年 赵磊. All rights reserved.
//

#import "Dog.h"
#import "MJExtension.h"

@implementation Dog

//同一转换名称为驼峰式命名
//eg:nickName -> nick_name
+(NSString*) mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName underlineFromCamel];
}

@end
