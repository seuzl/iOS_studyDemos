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
#import "Student.h"
#import "Bag.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        execute(simple_Json2Model,@"简单json->model");
        execute(complex_Json2Model, @"复杂json->model");
        execute(jsonArray2modelArray, @"json数组->model数组");
        execute(model2json, @"model->json");
    execute(modelArray2jsonArray, @"modelArray->jsonArray");
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

//modle->json
void model2json(){
    User *user = [[User alloc]init];
    user.name = @"zhaolei";
    user.icon = @"icon_zhaolei.png";
    
    Status *status = [[Status alloc]init];
    status.user = user;
    status.text = @"zhaolei de text";
    
    //model->json
    NSDictionary* statusDict = [status mj_keyValues];//单个model->json由类的［实例变量］调用
    NSLog(@"status=%@",statusDict);
    NSLog(@"status.text=%@",status.text);
    
    //多级映射model
    Student *stu = [[Student alloc] init];
    stu.ID = @"123";
    stu.oldName = @"rose";
    stu.nowName = @"jack";
    stu.desc = @"handsome";
    stu.nameChangedTime = @"2018-09-08";
    stu.books = @[@"Good book", @"Red book"];
    
    Bag *bag = [[Bag alloc]init];
    bag.name = @"赵磊的书包";
    bag.price = 205;
    stu.bag = bag;
    
    NSDictionary *stuDict = [stu mj_keyValues];
    NSLog(@"studict=%@",stuDict);
    NSLog(@"stuDict with ignored keys:%@",[stuDict mj_keyValuesWithIgnoredKeys:@[@"bag",@"oldName"]]);
    NSLog(@"stuDict 2 json string=%@",[stuDict mj_JSONString]);
    

}

//modelArray -> jsonArray
void modelArray2jsonArray(){
    User *user1 = [[User alloc]init];
    user1.name = @"zhaolei1";
    user1.icon = @"icon_zhaolei1.png";
    
    User *user2 = [[User alloc]init];
    user2.name = @"zhaolei2";
    user2.icon = @"icon_zhaolei2.png";
    
    NSArray *userArray = @[user1,user2];
    
    //modelArray->jsonArray
    NSArray *dictArray = [User mj_keyValuesArrayWithObjectArray:userArray];//model数组->json数组由［类］调用
    NSLog(@"userDictArray=%@",dictArray);
}

void execute(void (*fn)(), NSString *comment)
{
    MJExtensionLog(@"[******************%@******************开始]", comment);
    fn();
    MJExtensionLog(@"[******************%@******************结尾]\n ", comment);
}

// From here to end of file added by Injection Plugin //

#ifdef DEBUG
static char _inMainFilePath[] = __FILE__;
static const char *_inIPAddresses[] = {"223.3.72.29", "127.0.0.1", 0};

#define INJECTION_ENABLED
#import "/tmp/injectionforxcode/BundleInjection.h"
#endif
