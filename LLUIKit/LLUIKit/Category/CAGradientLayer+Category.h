//
//  CAGradientLayer+Category.h
//  LLUIKit
//
//  Created by 梁先生 on 2018/6/26.
//  Copyright © 2018年 liangxl. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CAGradientLayer (Category)

/**
 *  bounds : View bounds
 *  startColor: 开始颜色
 *  endColor: 结束颜色
 *  默认(start - end) = ({0.5,0.0},{0.5,1.0})
 */
+ (CAGradientLayer *)gradualChangingColor:(CGRect)bounds
                               startColor:(UIColor *)startColor
                                 endColor:(UIColor *)endColor;

/**
 *
 *  0,0 * * * * * * 0,1
 *   *               *
 *   *               *
 *   *               *
 *   *               *
 *   *               *
 *  1,0 * * * * * * 1,1
 *
 */
+ (CAGradientLayer *)gradualChangingColor:(CGRect)bounds
                               startColor:(UIColor *)startColor
                                 endColor:(UIColor *)endColor
                               startPoint:(CGPoint)startPoint
                                 endPoint:(CGPoint)endPoint;

@end
