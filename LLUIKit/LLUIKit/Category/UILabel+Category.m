//
//  UILabel+Category.m
//  LLUIKit
//
//  Created by 梁先生 on 2018/6/26.
//  Copyright © 2018年 liangxl. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)

- (CGFloat)getHeightForWidth:(CGFloat)width{
    CGSize expectedSize = [self sizeThatFits:CGSizeMake(width, CGFLOAT_MAX)];
    return expectedSize.height;
}

- (CGFloat)getWidthForHeight:(CGFloat)height{
    CGSize expectedSize = [self sizeThatFits:CGSizeMake(CGFLOAT_MAX, height)];
    return expectedSize.width;
}


@end
