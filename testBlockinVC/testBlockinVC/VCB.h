//
//  VCB.h
//  testBlockinVC
//
//  Created by 赵磊 on 15/12/28.
//  Copyright © 2015年 赵磊. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol VCBDelegate <NSObject>
//
//-(void)setLabelText:(NSString*) str;
//
//@end


//typedef void (^GetTextBKT) (NSString* str);

@interface VCB : UIViewController

//@property (strong,nonatomic ) GetTextBKT getTextBK;

@property (strong, nonatomic) IBOutlet UITextField *textField;

//@property(weak,nonatomic) id<VCBDelegate> delegate;

@end
