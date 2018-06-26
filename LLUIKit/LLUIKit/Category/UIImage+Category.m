//
//  UIImage+Category.m
//  LLUIKit
//
//  Created by 梁先生 on 2018/6/26.
//  Copyright © 2018年 liangxl. All rights reserved.
//

#import "UIImage+Category.h"

@implementation UIImage (Category)

- (UIImage *)flipImage{
    
    NSInteger flipImageOrientation = (self.imageOrientation + 4) % 8;
    flipImageOrientation += flipImageOrientation%2==0 ? 1 : -1;
    UIImage *flipImage = [UIImage imageWithCGImage:self.CGImage scale:self.scale orientation:flipImageOrientation];
    return flipImage;
}

+ (UIImage *)gradientImageFromColors:(NSArray *)colors
                           imageRect:(CGRect)bounds{
    
    NSMutableArray *arr = [NSMutableArray array];
    for(UIColor *color in colors) {
        [arr addObject:(id)color.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(bounds.size, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)arr, NULL);
    CGPoint start = CGPointMake(CGRectGetMidX(bounds), CGRectGetMinY(bounds));
    CGPoint end = CGPointMake(CGRectGetMidX(bounds), CGRectGetMaxY(bounds));
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}


@end
