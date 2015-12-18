//
//  Status.h
//  learn_MJExtension
//
//  Created by 赵磊 on 15/12/17.
//  Copyright © 2015年 赵磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Status : NSObject

@property(copy,nonatomic) NSString *text;
@property(strong,nonatomic) User *user;
@property(strong,nonatomic) Status *retweetedStatus;

@end
