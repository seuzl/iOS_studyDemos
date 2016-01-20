//
//  ViewController.m
//  testCoreData
//
//  Created by 赵磊 on 16/1/20.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

- (IBAction)finishEdit:(id)sender {
    
    [sender resignFirstResponder];
}


@end
