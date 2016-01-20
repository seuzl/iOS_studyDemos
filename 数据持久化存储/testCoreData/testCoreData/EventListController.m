//
//  EventListController.m
//  testCoreData
//
//  Created by 赵磊 on 16/1/20.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import "AppDelegate.h"
#import "EventListController.h"
#import "FKEntity.h"
#import "ViewController.h"

@interface EventListController ()

@property(nonatomic,strong) AppDelegate* appDelegate;

@end

NSMutableArray* array;

@implementation EventListController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated
{
    
    
    [super viewWillAppear:animated];
    
    /*
     * coreData-----------------------------------> query
     */
    
//    1⃣️创建抓取数据的请求对象
    NSFetchRequest* request = [[NSFetchRequest alloc]init];
//    2⃣️description设置要抓取实体的类型
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"FKEntity" inManagedObjectContext:self.appDelegate.managedObjectContext];
//    3⃣️设置抓取实体
    [request setEntity:entity];
    
    NSError* error = nil;
    
//    4⃣️用 context 执行抓取数据请求，返回符合条件的数据
    array = [[self.appDelegate.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"event" forIndexPath:indexPath];
    FKEntity* entity = (FKEntity*)[array objectAtIndex:indexPath.row];
    
    cell.textLabel.text = entity.name;
    cell.detailTextLabel.text = [entity.happyDate description];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be .
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)toggleDelete:(id)sender {
    
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    if (self.tableView.editing) {
        [self.deleteBn setTitle:@"完成" forState:UIControlStateNormal];

    } else {
        [self.deleteBn setTitle:@"删除" forState:UIControlStateNormal];

    }
    

}

-(IBAction)unWindSegueToEventListController:(UIStoryboardSegue *)segue
{
    ViewController* editVC = (ViewController*)segue.sourceViewController;

    /*
     * coreData-----------------------------------> insert
     */
    
    
    //    1⃣️description 创建实体
    FKEntity* newEntity = [NSEntityDescription insertNewObjectForEntityForName:@"FKEntity" inManagedObjectContext:self.appDelegate.managedObjectContext];

    //     2⃣️为新实体设置属性
    newEntity.name = editVC.eventTextField.text;
    newEntity.happyDate = [NSDate date];
    
    NSError* error = nil;

    //     3⃣️contex save:
    if ([self.appDelegate.managedObjectContext save:&error]) {
        
//        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"新实体保存成功`!" preferredStyle:UIAlertControllerStyleAlert];
//        
//        UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//            NSLog(@"点击cancel！");
//        }];
//        
//        UIAlertAction* confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            NSLog(@"点击confirm!");
//        }];
//        
//        [alert addAction:cancelAction];
//        [alert addAction:confirmAction];
//        
//        [editVC presentViewController:alert animated:YES completion:nil];
        
        NSLog(@"保存成功!");

    } else {
        NSLog(@"新实体保存出错!");
    }
    
}

//返回值：删除指定表格行时确认按钮的文本
-(NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"确认删除";
}

//编辑（插入／删除）
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        
        /*
         * coreData-----------------------------------> delete
         */
        
        
//        1⃣️获取要删除的实体
        NSError* error = nil;
        FKEntity* deletedEntity = [array objectAtIndex:indexPath.row];
        
//        2⃣️contex删除并保存(⚠️⚠️⚠️)
        [self.appDelegate.managedObjectContext deleteObject:deletedEntity];
        
//        3⃣️contex save:
        if(![self.appDelegate.managedObjectContext save:&error])
        {
            NSLog(@"删除出错!");
        }
        
//        从array删除
        [array removeObjectAtIndex:indexPath.row];
        
//        从界面删除
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }
}


@end
