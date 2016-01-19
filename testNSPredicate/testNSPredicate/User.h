//
//  User.h
//  testNSPredicate
//
//  Created by 赵磊 on 16/1/19.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property(nonatomic,copy) NSString* name;
@property(nonatomic,assign) int age;

-(id)initWithName:(NSString*)aname andAge:(int) aage;

@end
