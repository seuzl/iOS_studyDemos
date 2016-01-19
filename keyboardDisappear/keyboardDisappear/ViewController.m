//
//  ViewController.m
//  keyboardDisappear
//
//  Created by 赵磊 on 16/1/19.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//textField:实现delegate方法,点击键盘上的return触发方法.
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == self.textField){
        [textField resignFirstResponder];
    }
    return YES;
}

//textField2:创建并实现didEndOnExit,这个是点击 return 的事件
- (IBAction)didEndOnExit:(id)sender {
    [self.textField2 resignFirstResponder];
}

//textField3:点击背景消失------------------------------------>最常用最简单
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.textField3 resignFirstResponder];
}

@end
