//
//  UIFont+Category.h
//  LLUIKit
//
//  Created by 梁先生 on 2018/6/26.
//  Copyright © 2018年 liangxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Category)

/**
 *  平方字体
 *  >9.0平方，否则：默认
 */
+ (UIFont *)pingFangSemiboldWithSize:(CGFloat)fontSize;

+ (UIFont *)pingFangMediumWithSize:(CGFloat)fontSize;

+ (UIFont *)pingFangRegularWithSize:(CGFloat)fontSize;


@end
