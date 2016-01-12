//
//  VCA.m
//  testBlockinVC
//
//  Created by 赵磊 on 15/12/28.
//  Copyright © 2015年 赵磊. All rights reserved.
//

#import "VCA.h"
#import "VCB.h"

@interface VCA ()

@end

@implementation VCA

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gotob:(id)sender {

}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    VCB* vcb = (VCB*)segue.destinationViewController;
//    vcb.getTextBK = ^(NSString *str){
//        self.label.text = str;
//    };
//}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    VCB* vcb = (VCB*)segue.destinationViewController;
//    vcb.delegate = self;
//}
//
//-(void)setLabelText:(NSString *)str{
//    self.label.text = str;
//}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setAlabel:) name:@"setAlabel" object:nil];
}

-(void)setAlabel:(NSNotification*) noti{
    self.label.text = noti.object;
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"setAlabel" object:nil];
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
