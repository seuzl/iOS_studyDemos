//
//  FKApple.h
//  testAccessControlCharacter
//
//  Created by 赵磊 on 16/1/12.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FKApple : NSObject
{
//    @package
//    @private
//    @public
//    @protected
    double _weight;//不指明访问控制符时默认procted;
}
-(double)weight;
@end
