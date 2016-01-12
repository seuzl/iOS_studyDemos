
//
//  VCB.m
//  testBlockinVC
//
//  Created by 赵磊 on 15/12/28.
//  Copyright © 2015年 赵磊. All rights reserved.
//

#import "VCB.h"

@interface VCB ()

@end

@implementation VCB

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

//    self.getTextBK(self.textField.text);
//    [self.delegate setLabelText:self.textField.text];
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"setAlabel" object:self userInfo:@{@"name":self.textField.text}];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"setAlabel" object:self.textField.text];
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
