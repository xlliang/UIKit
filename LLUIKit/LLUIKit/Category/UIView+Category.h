//
//  UIView+Category.h
//  LLUIKit
//
//  Created by 梁先生 on 2017/9/20.
//  Copyright © 2017年 liangxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)


#pragma mark - CornerRaidus
/*
 *给UIView添加圆角 top && left && bottom && right
 */
- (void)viewCornerRaidus:(CGFloat)raidus;

/*
 *raidus : 圆角大小
 *corners: 设置圆角的位置 top || left || bottom || right
 */
- (void)viewCornerRaidusType:(CGFloat)raidus roundingCorners:(UIRectCorner)corners;

#pragma mark - View Size
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize  size;

@end
