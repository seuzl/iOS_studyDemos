//
//  EventListController.h
//  testCoreData
//
//  Created by 赵磊 on 16/1/20.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventListController : UITableViewController


@property (strong, nonatomic) IBOutlet UIButton *deleteBn;

- (IBAction)toggleDelete:(id)sender;


-(IBAction)unWindSegueToEventListController:(UIStoryboardSegue*)segue;

@end
