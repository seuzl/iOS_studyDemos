//
//  myCell.h
//  testCollectionView
//
//  Created by 赵磊 on 16/1/14.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *highlightImage;

- (void) changeHighLightWithBool: (BOOL) highlight;


@end
