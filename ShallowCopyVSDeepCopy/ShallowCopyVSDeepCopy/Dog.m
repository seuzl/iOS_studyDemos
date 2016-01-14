//
//  Dog.m
//  ShallowCopyVSDeepCopy
//
//  Created by 赵磊 on 16/1/14.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import "Dog.h"

@implementation Dog

-(id)copyWithZone:(NSZone *)zone
{
    Dog* dog = [[self class]allocWithZone:zone];
//    dog.name = self.name;
    dog.name = [self.name mutableCopy];
    dog.age  = self.age;
    
    return dog;
}

@end
