//
//  myCell.m
//  testCollectionView
//
//  Created by 赵磊 on 16/1/14.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import "myCell.h"

@implementation myCell


- (void) changeHighLightWithBool: (BOOL) highlight{
    
    NSString *imageName = @"003.png";
    
    if (highlight) {
        imageName = @"002.png";
    }
    
    [_highlightImage setImage: [UIImage imageNamed:imageName]];
}

@end
