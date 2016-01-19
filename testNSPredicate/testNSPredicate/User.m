//
//  User.m
//  testNSPredicate
//
//  Created by 赵磊 on 16/1/19.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import "User.h"

@implementation User


-(id)initWithName:(NSString *)aname andAge:(int)aage
{
    self = [self init];
    if (self) {
        _name = aname;
        _age  = aage;
    }
    return self;
}

@end
