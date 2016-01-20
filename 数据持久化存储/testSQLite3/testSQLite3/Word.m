//
//  Word.m
//  testSQLite3
//
//  Created by 赵磊 on 16/1/20.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import "Word.h"

@implementation Word

-(id)initWithID:(int)word_id word:(NSString *)aword detail:(NSString *)adetail
{
    self = [super init];
    if(self){
        self.word_id = word_id;
        self.word = aword;
        self.detail = adetail;
    }
    return self;
}

@end
