//
//  CAGradientLayer+Category.m
//  LLUIKit
//
//  Created by 梁先生 on 2018/6/26.
//  Copyright © 2018年 liangxl. All rights reserved.
//

#import "CAGradientLayer+Category.h"

@implementation CAGradientLayer (Category)

+ (CAGradientLayer *)gradualChangingColor:(CGRect)bounds
                               startColor:(UIColor *)startColor
                                 endColor:(UIColor *)endColor{
    
    CAGradientLayer *gradientLayer = [CAGradientLayer gradualChangingColor:bounds startColor:startColor endColor:endColor startPoint:CGPointMake(0.5, 0) endPoint:CGPointMake(0.5, 1)];
    return gradientLayer;
}

+ (CAGradientLayer *)gradualChangingColor:(CGRect)bounds
                               startColor:(UIColor *)startColor
                                 endColor:(UIColor *)endColor
                               startPoint:(CGPoint)startPoint
                                 endPoint:(CGPoint)endPoint{
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = bounds;
    gradientLayer.colors = @[(__bridge id)startColor.CGColor,(__bridge id)endColor.CGColor];
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    gradientLayer.locations = @[@0,@1];
    return gradientLayer;
    
}

@end
