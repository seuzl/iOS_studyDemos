//
//  main.m
//  learn_MJExtension
//
//  Created by 赵磊 on 15/12/17.
//  Copyright © 2015年 赵磊. All rights reserved.
//
#import "main.h"
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "User.h"
#import "MJExtension.h"
#import "StatusResult.h"
#import "Status.h"
#import "Ad.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        execute(simple_Json2Model,@"简单json->model");
        execute(complex_Json2Model, @"复杂json->model");
        execute(jsonArray2modelArray, @"json数组->model数组");
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

 // simple json -> model
void simple_Json2Model(){

    NSDictionary *dict = @{
                           @"name" : @"Jack",
                           @"icon" : @"lufy.png",
                           @"age" : @20,
                           @"height" : @1.55,
                           @"money" : @"100.9",
                           @"sex" : @(SexFemale),
                           @"gay" : @"1"
                           //                               @"gay" : @"NO"
                           //                               @"gay" : @"true"
                           };
    User *user = [User mj_objectWithKeyValues:dict];
    NSLog(@"name=%@, icon=%@, age=%zd, heigh=%f, sex=%d, gay=%d",user.name,user.icon,user.age,user.height,user.sex,user.gay);
}

//complex json -> model
void complex_Json2Model(){
    //model中有数组，数组中套model
    NSDictionary *dict = @{
                           @"statuses" : @[
                                   @{
                                       @"text" : @"今天天气真不错！",
                                       
                                       @"user" : @{
                                               @"name" : @"Rose",
                                               @"icon" : @"nami.png"
                                               }
                                       },
                                   
                                   @{
                                       @"text" : @"明天去旅游了",
                                       
                                       @"user" : @{
                                               @"name" : @"Jack",
                                               @"icon" : @"lufy.png"
                                               }
                                       }
                                   
                                   ],
                           
                           @"ads" : @[
                                   @{
                                       @"image" : @"ad01.png",
                                       @"url" : @"http://www.小码哥ad01.com"
                                       },
                                   @{
                                       @"image" : @"ad02.png",
                                       @"url" : @"http://www.小码哥ad02.com"
                                       }
                                   ],
                           
                           @"totalNumber" : @"2014",
                           @"previousCursor" : @"13476589",
                           @"nextCursor" : @"13476599"
                           };
    StatusResult* statusResult = [StatusResult mj_objectWithKeyValues:dict];
    NSLog(@"totalNumer=%@,previousCursor=%lld,nextCursor=%lld",statusResult.totalNumber,statusResult.previousCursor,statusResult.nextCursor);
    
    //打印数组属性-->Status
    for (Status * status in statusResult.statuses) {
        NSLog(@"text=%@,name=%@,icon=%@",status.text,status.user.name,status.user.icon);
    }
    //打印数组-->Ad
    for (Ad *ad in statusResult.ads) {
        NSLog(@"ad.image=%@,ad.url=%@",ad.image,ad.url);
    }
}


//json array -> model array
void jsonArray2modelArray(){
    
    NSArray *dictArray = @[
                           @{
                               @"name" : @"Jack",
                               @"icon" : @"lufy.png",
                               },
                           
                           @{
                               @"name" : @"Rose",
                               @"icon" : @"nami.png",
                               }
                           ];
    NSArray *userArrsay = [User mj_objectArrayWithKeyValuesArray:dictArray];//注意消息通知者是User
    for (User *user in userArrsay) {
        NSLog(@"user.name=%@,user.icon=%@",user.name,user.icon);
    }
    
}

void execute(void (*fn)(), NSString *comment)
{
    MJExtensionLog(@"[******************%@******************开始]", comment);
    fn();
    MJExtensionLog(@"[******************%@******************结尾]\n ", comment);
}
