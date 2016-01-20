//
//  FKEntity+CoreDataProperties.h
//  testCoreData
//
//  Created by 赵磊 on 16/1/20.
//  Copyright © 2016年 赵磊. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "FKEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface FKEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSDate *happyDate;

@end

NS_ASSUME_NONNULL_END
