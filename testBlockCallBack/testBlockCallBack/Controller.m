//
//  Controller.m
//  testBlockCallBack
//
//  Created by 赵磊 on 15/12/27.
//  Copyright © 2015年 赵磊. All rights reserved.
//

#import "Controller.h"
#import "ComponentBlock.h"

//使用extension声明组件，以实现信息隐藏
@interface Controller ()
@property(nonatomic,strong) ComponentBlock *component;
@end

@implementation Controller
//对组件进行初始化
-(instancetype)init{
    self = [super init];
    if(self){
        self.component = [ComponentBlock new];
//        代码块回调
        [self.component setBlockdemo:^(NSString* param){
//            NSLog(@"我可以看到component中的param:%@",param);
        }];
    }
    return self;
}

-(void)start{
    [self.component runBlock];
}

@end
