//
//  Book.h
//  learn_MJExtension
//
//  Created by 赵磊 on 15/12/17.
//  Copyright © 2015年 赵磊. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Box;

   @interface Book : NSObject


@property (copy,nonatomic  ) NSString *name;
@property (copy,nonatomic  ) NSString *publisher;
@property (strong,nonatomic) NSData   *publishedTime;
@property (strong,nonatomic) Box      *box;

@end
