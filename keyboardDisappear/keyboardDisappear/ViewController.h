//
//  ViewController.h
//  keyboardDisappear
//
//  Created by 赵磊 on 16/1/19.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (strong, nonatomic) IBOutlet UITextField *textField;

- (IBAction)didEndOnExit:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *textField2;

@property (strong, nonatomic) IBOutlet UITextField *textField3;


@end

