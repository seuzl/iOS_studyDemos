//
//  Word.h
//  testSQLite3
//
//  Created by 赵磊 on 16/1/20.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Word : NSObject

@property(nonatomic,assign) int word_id;
@property(nonatomic) NSString* word;
@property(nonatomic) NSString* detail;

-(id)initWithID:(int)word_id word:(NSString*) aword detail:(NSString*) adetail;
@end
