//
//  main.m
//  testAccessControlCharacter
//
//  Created by 赵磊 on 16/1/12.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FKApple.h"
#import "FFKApple.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        FFKApple* apple = [FFKApple alloc];
//        [apple setColor:@"red" andWeight:30.0f];
        
        //color限制符package，可在frame内访问;weight限制符为默认（procted）,不可直接访问，只能通过get函数。可看到get函数被子类默认继承，可直接使用。
//        NSLog(@"%@,%g",apple->color,[apple weight]);
        [apple setColor:@"yellow"];
        [apple color];
        
        

        
        NSLog(@"%@",apple.color);
    }
    return 0;
}
