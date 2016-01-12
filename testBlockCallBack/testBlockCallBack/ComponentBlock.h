//
//  ComponentBlock.h
//  testBlockCallBack
//
//  Created by 赵磊 on 15/12/27.
//  Copyright © 2015年 赵磊. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义block块变量类型
typedef void (^BlockType) (NSString *param);

@interface ComponentBlock : NSObject

//声明block类型变量：
@property(nonatomic,strong)BlockType blockdemo;

//执行代码块
-(void)runBlock;

@end
