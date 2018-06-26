//
//  UIImage+Category.h
//  LLUIKit
//
//  Created by 梁先生 on 2018/6/26.
//  Copyright © 2018年 liangxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

/**
 *  翻转图片
 */
- (UIImage *)flipImage;

/**
 *  渐变图片
 *  colors : UIColor
 */
+ (UIImage *)gradientImageFromColors:(NSArray *)colors
                           imageRect:(CGRect)bounds;

@end
