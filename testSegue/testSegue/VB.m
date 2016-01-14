//
//  VB.m
//  testSegue
//
//  Created by 赵磊 on 16/1/14.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import "VB.h"
#import "VA.h"

@interface VB ()

@end

@implementation VB

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textField.text = self.editContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(UIButton *)sender {
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    VA* destVC = (VA*)segue.destinationViewController;
    //注意content属性是copy,并非lable.text会受content影响，而是由于segue采用modal形式返回，所以VA [viewDidLoad]函数会再次执行。如果是push模式，viewDidLoad不会执行。
    [destVC setValue:self.textField.text forKey:@"content"];
//    destVC.content = self.textField.text;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
