//
//  Dog.h
//  ShallowCopyVSDeepCopy
//
//  Created by 赵磊 on 16/1/14.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject<NSCopying>

//@property(nonatomic,strong) NSMutableString* name;
@property(nonatomic,strong) NSMutableString* name;
@property(nonatomic,assign) int age;

@end
