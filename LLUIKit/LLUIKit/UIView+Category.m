//
//  UIView+Category.m
//  LLUIKit
//
//  Created by 梁先生 on 2017/9/20.
//  Copyright © 2017年 liangxl. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

- (void)viewCornerRaidus:(CGFloat)raidus{
    [self destViewCornerRaidusType:raidus roundingCorners:UIRectCornerAllCorners];
}

- (void)viewCornerRaidusType:(CGFloat)raidus roundingCorners:(UIRectCorner)corners{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(raidus, raidus)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
