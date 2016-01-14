//
//  MyCollectionVC.m
//  testCollectionView
//
//  Created by 赵磊 on 16/1/14.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import "MyCollectionVC.h"
#import "myCell.h"

@interface MyCollectionVC ()

@end

@implementation MyCollectionVC

static NSString * const reuseIdentifier = @"myCell";

- (void)viewDidLoad {
    [super viewDidLoad];

    //⚠️⚠️⚠️千万注意：
    //⚠️⚠️⚠️已经在sb里collectionview的cell指明identifier.
    //⚠️⚠️⚠️不需要再注册！！！
    //⚠️⚠️⚠️注册会出错！
    //⚠️⚠️⚠️会显示黑屏!
    
    //⚠️⚠️⚠️[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];

    //支持多选
    self.collectionView.allowsMultipleSelection = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource> -- 负责加载数据源，Section的个数，每个Section中Cell的个数，每个Section中Supplementary View的种类。

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 5;

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellfor");
    
    myCell *cell = (myCell*)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    return cell;
}

-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if([kind isEqualToString:UICollectionElementKindSectionHeader]){
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        return header;
    }
    
    UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
    return footer;

}

#pragma mark <UICollectionViewDelegateFlowLayout> -- 负责布局显示，各种间距、大小等等

//    1⃣️改变cell尺寸
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(50, 50);
    } else {
        return CGSizeMake(60, 60);
    }
}

//   2⃣️改变 Section 的上下左右边距–UIEdgeInsetsMake(上, 左, 下, 右)，逆时针旋转。
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        return UIEdgeInsetsMake(50, 50, 50, 50);
    } else {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
}

//   3⃣️设置每个 Cell 的上下边距 LineSpacing
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        return  5.0f;
    } else {
        return 20.0f;
    }
}

//   4⃣️设置每个 Cell 的左右边距,Interitem
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        return 5.0f;
    }else{
        return 20.0f;
    }
}

//   5⃣️设置Header View和Footer View的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(200, 50);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(200, 50);
}


#pragma mark <UICollectionViewDelegate> -- 负责Cell的交互。

//设置Cell可以高亮
-(BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

/**
 * 根据高亮状态修改背景图片
 */
- (void) changeHighlightCellWithIndexPaht: (NSIndexPath *) indexPath{
    //获取当前变化的Cell
    myCell *currentHighlightCell = (myCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    
    [currentHighlightCell changeHighLightWithBool:currentHighlightCell.highlighted];
    
    if (currentHighlightCell.highlighted == YES){
        
        NSLog(@"第%ld个Section上第%ld个Cell变为高亮",indexPath.section ,indexPath.row);
        return;
    }
    
    if (currentHighlightCell.highlighted == NO){
        NSLog(@"第%ld个Section上第%ld个Cell变为非高亮",indexPath.section ,indexPath.row);
    }
    
}

//如果cell可以高亮，cell高亮后调用
-(void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self changeHighlightCellWithIndexPaht:indexPath];
}

-(void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self changeHighlightCellWithIndexPaht:indexPath];
}

//cell是否可选中
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//Cell多选时是否支持取消功能
-(BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}



/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
