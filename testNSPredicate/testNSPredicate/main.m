//
//  main.m
//  testNSPredicate
//
//  Created by 赵磊 on 16/1/19.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        User *user1 = [[User alloc]initWithName:@"sname1" andAge:1];
        User *user2 = [[User alloc]initWithName:@"name2" andAge:2];

        
//       判断对象的属性是否符合规则。
        NSPredicate* pred = [NSPredicate predicateWithFormat:@"name LIKE 's*'"];
        if ([pred evaluateWithObject:user2]) {
            NSLog(@"user2.name符合规则.");
        } else {
            NSLog(@"user2.name不符合规则.");
        }
        
        NSDictionary *dict = @{@"name":@"shaha"};
        if ([pred evaluateWithObject:dict]) {
            NSLog(@"字符串name符合规则.");
        } else {
            NSLog(@"字符串name不符合规则.");
        }
        
        
//        加入占位符
        NSPredicate* pred3 = [NSPredicate predicateWithFormat:@"%K LIKE $SUBSTR",@"name"];
        NSPredicate* pred4 = [pred3 predicateWithSubstitutionVariables:[NSDictionary dictionaryWithObjectsAndKeys:@"s*",@"SUBSTR", nil]];
        if ([pred4 evaluateWithObject:user1]) {
            NSLog(@"占位符 -> user1 符合规则");
        } else {
            NSLog(@"占位符 -> user1 不符合规则");
        }

        
//        直接判断字符串本身是否符合规则。
//        NSPredicate* pred2 = [NSPredicate predicateWithFormat:@"SELF LIKE  's*'"];
        NSPredicate* pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES  's*'"];//正则表达式用MATCHES关键字.
        NSString* str = @"zhaolei";
        if ([pred2 evaluateWithObject:str]) {
            NSLog(@"str符合规则.");
        } else {
            NSLog(@"str不符合规则.");
        }
        
    }
    return 0;
}
