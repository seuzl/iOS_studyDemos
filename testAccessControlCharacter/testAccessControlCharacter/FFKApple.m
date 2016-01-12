//
//  FFKApple.m
//  testAccessControlCharacter
//
//  Created by 赵磊 on 16/1/12.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import "FFKApple.h"

@implementation FFKApple

-(void)setColor:(NSString *)acolor andWeight:(double)aweight{
    self->color = acolor;
    self->_weight = aweight;//weight 限制符为procted,可在子类中访问。接口中的成员变量默认为procted.
}

-(void)setColor:(NSString *)acolor
{
    self->color = acolor;
}

-(NSString*)getColor
{
    return self->color;
}

@end
