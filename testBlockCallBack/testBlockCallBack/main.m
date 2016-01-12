//
//  main.m
//  testBlockCallBack
//
//  Created by 赵磊 on 15/12/27.
//  Copyright © 2015年 赵磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Controller.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        Controller *controller = [[Controller alloc]init];
        [controller start];
    }
    return 0;
}
