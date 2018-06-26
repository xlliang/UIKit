//
//  UIButton+Category.h
//  LLUIKit
//
//  Created by 梁先生 on 2018/6/26.
//  Copyright © 2018年 liangxl. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_OPTIONS(NSUInteger, LLButtonLayout) {
    LLButtonLayoutImageLeftTitleRight       = 0,
    LLButtonLayoutImageRightTitleLeft       = 1,
    LLButtonLayoutImageTopTitleBottom       = 2,
    LLButtonLayoutImageBottomTitleTop       = 3,
};


@interface UIButton (Category)

- (void)setImage:(UIImage *)image
           title:(NSString *)title
       btnLayout:(LLButtonLayout)btnLayout
   middleSpacing:(CGFloat)middleSpacing
        forState:(UIControlState)state;

- (void)setImage:(UIImage *)image
       imageSize:(CGSize)imageSize
           title:(NSString *)title
       btnLayout:(LLButtonLayout)btnLayout
   middleSpacing:(CGFloat)middleSpacing
        forState:(UIControlState)state;

@end
