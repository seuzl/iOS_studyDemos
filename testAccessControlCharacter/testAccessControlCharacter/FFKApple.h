//
//  FFKApple.h
//  testAccessControlCharacter
//
//  Created by 赵磊 on 16/1/12.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import "FKApple.h"

@interface FFKApple : FKApple
{
    @package
    NSString* color;
}

-(void)setColor:(NSString*) acolor andWeight:(double) aweight;

-(void)setColor:(NSString*) color;

-(NSString*)getColor;

@end
