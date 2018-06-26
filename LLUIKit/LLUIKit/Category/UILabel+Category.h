//
//  UILabel+Category.h
//  LLUIKit
//
//  Created by 梁先生 on 2018/6/26.
//  Copyright © 2018年 liangxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Category)

/**
 *  必须先设置label的文本，否则没有意义
 */

/**
 *  获取label宽度
 */
- (CGFloat)getHeightForWidth:(CGFloat)width;

/**
 *  获取label高度
 */
- (CGFloat)getWidthForHeight:(CGFloat)height;


@end
