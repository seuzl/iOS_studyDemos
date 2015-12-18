//
//  main.h
//  learn_MJExtension
//
//  Created by 赵磊 on 15/12/17.
//  Copyright © 2015年 赵磊. All rights reserved.
//

#ifndef main_h
#define main_h
#import <Foundation/Foundation.h>

// json -> model

void simple_Json2Model();
void complex_Json2Model();
void jsonArray2modelArray();

//model -> json
void simple_Model2Json();
void complex_Model2Json();
void modelArray2jsonArray();

void execute(void (*fn)(),NSString *comment);


#endif /* main_h */
