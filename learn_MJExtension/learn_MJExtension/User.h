//
//  User.h
//  learn_MJExtension
//
//  Created by 赵磊 on 15/12/17.
//  Copyright © 2015年 赵磊. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    SexMale,
    SexFemale
} Sex;

@interface User : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString* icon;
@property (nonatomic,assign) unsigned int age;
@property (nonatomic,assign) float height;
@property (nonatomic,strong) NSNumber *money;
@property (nonatomic,assign) Sex sex;
@property (nonatomic,assign,getter=isGay) BOOL gay;

@end
