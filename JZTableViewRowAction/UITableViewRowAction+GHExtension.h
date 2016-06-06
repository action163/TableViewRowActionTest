//
//  UITableViewRowAction+GHExtension.h
//  TableViewRowActionTest
//
//  Created by GHl on 16/6/3.
//  Copyright © 2016年 jiaozhenlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewRowAction (GHExtension)

@property (nonatomic, strong, nullable) UIImage *image;

@property (nonatomic, assign) BOOL enabled;

+ (nonnull instancetype)rowActionWithStyle:(UITableViewRowActionStyle)style image:(nullable UIImage *)image handler:(nullable void (^)(UITableViewRowAction * _Nullable action, NSIndexPath * _Nullable indexPath))handler;

@end