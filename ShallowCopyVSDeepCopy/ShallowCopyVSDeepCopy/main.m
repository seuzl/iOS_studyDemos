//
//  main.m
//  ShallowCopyVSDeepCopy
//
//  Created by 赵磊 on 16/1/14.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Dog *dog1 = [[Dog alloc]init];
//        dog1.name = @"旺财";
        dog1.name = [NSMutableString stringWithFormat:@"旺财"];
//        dog1.name = [NSString stringWithFormat:@"旺财"];
        dog1.age = 20;
        
        Dog* dog2 = [dog1 copy];
//        dog2.name = @"wangcai";
//        dog2.name = [NSMutableString stringWithFormat:@"wangcai"];
        [dog2.name replaceCharactersInRange:NSMakeRange(0, 2) withString:@"wangcai"];
//        dog2.name = [NSString stringWithFormat:@"wangcai"];
//        dog2.name = @"wangcai";
        dog2.age = 21;
        
        NSLog(@"%@,%d",dog1.name,dog1.age);
        NSLog(@"%@,%d",dog2.name,dog2.age);
        
    }
    return 0;
}
