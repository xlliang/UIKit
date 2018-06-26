//
//  UIButton+Category.m
//  LLUIKit
//
//  Created by 梁先生 on 2018/6/26.
//  Copyright © 2018年 liangxl. All rights reserved.
//

#import "UIButton+Category.h"
#import "NSString+Category.h"
#import "UIView+Category.h"

@implementation UIButton (Category)

- (void)setImage:(UIImage *)image
           title:(NSString *)title
       btnLayout:(LLButtonLayout)btnLayout
   middleSpacing:(CGFloat)middleSpacing
        forState:(UIControlState)state
{
    CGSize imageSize = image.size;
    [self setImage:image imageSize:imageSize title:title btnLayout:btnLayout middleSpacing:middleSpacing forState:state];
}

- (void)setImage:(UIImage *)image
       imageSize:(CGSize)imageSize
           title:(NSString *)title
       btnLayout:(LLButtonLayout)btnLayout
   middleSpacing:(CGFloat)middleSpacing
        forState:(UIControlState)state
{
    [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [self setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];
    [self setImage:image forState:state];
    [self setTitle:title forState:state];
    [self.titleLabel sizeToFit];
    CGSize buttonSize = self.bounds.size;
    CGSize imageOldSize = image.size;
    
    CGSize strSize = [title customSizeWithFont:self.titleLabel.font constrainedToSize:CGSizeMake(MAXFLOAT, self.width)];
    
    switch (btnLayout) {
        case LLButtonLayoutImageLeftTitleRight:{
            
            CGFloat titleTopPadding = (buttonSize.height-strSize.height)/2.0;
            CGFloat titleBottomPadding = (buttonSize.height-strSize.height)/2.0;
            //(buttonSize.width - strSize.width)/2.0 - imageOldSize.width这段代码让titleLabel居中
            CGFloat titleLeftPadding = (buttonSize.width - strSize.width)/2.0 - imageOldSize.width + (imageSize.width + middleSpacing)/2.0;
            CGFloat titleRightPadding = (buttonSize.width  - strSize.width)/2.0 - imageOldSize.width - (imageSize.width + middleSpacing)/2.0;
            [self setTitleEdgeInsets:UIEdgeInsetsMake(titleTopPadding, titleLeftPadding, titleBottomPadding, titleRightPadding)];
            
            CGFloat imageTopPadding = (buttonSize.height-imageSize.height)/2;
            CGFloat imageBottomPadding = (buttonSize.height-imageSize.height)/2;
            CGFloat imageLeftPadding = (buttonSize.width - imageSize.width)/2.0 - (strSize.width + middleSpacing)/2.0;
            CGFloat imageRightPadding = (buttonSize.width - imageSize.width)/2.0 + (strSize.width + middleSpacing)/2.0;
            [self setImageEdgeInsets:UIEdgeInsetsMake(imageTopPadding, imageLeftPadding, imageBottomPadding, imageRightPadding)];
            
            break;
        }
        case LLButtonLayoutImageRightTitleLeft:{
            
            CGFloat titleTopPadding = (buttonSize.height-strSize.height)/2.0;
            CGFloat titleBottomPadding = (buttonSize.height-strSize.height)/2.0;
            //(buttonSize.width - strSize.width)/2.0 - imageOldSize.width这段代码让titleLabel居中
            CGFloat titleLeftPadding = (buttonSize.width - strSize.width)/2.0 - imageOldSize.width - (imageSize.width + middleSpacing)/2.0;
            CGFloat titleRightPadding = (buttonSize.width  - strSize.width)/2.0 - imageOldSize.width + (imageSize.width + middleSpacing)/2.0;
            [self setTitleEdgeInsets:UIEdgeInsetsMake(titleTopPadding, titleLeftPadding, titleBottomPadding, titleRightPadding)];
            
            CGFloat imageTopPadding = (buttonSize.height-imageSize.height)/2;
            CGFloat imageBottomPadding = (buttonSize.height-imageSize.height)/2;
            CGFloat imageLeftPadding = (buttonSize.width - imageSize.width)/2.0 + (strSize.width + middleSpacing)/2.0;
            CGFloat imageRightPadding = (buttonSize.width - imageSize.width)/2.0 - (strSize.width + middleSpacing)/2.0;
            [self setImageEdgeInsets:UIEdgeInsetsMake(imageTopPadding, imageLeftPadding, imageBottomPadding, imageRightPadding)];
            
            break;
        }
        case LLButtonLayoutImageTopTitleBottom:{
            
            CGFloat titleTopPadding = (buttonSize.height-strSize.height-middleSpacing-imageSize.height)/2.0 + middleSpacing + imageSize.height;
            CGFloat titleBottomPadding = (buttonSize.height-strSize.height-middleSpacing-imageSize.height)/2.0;
            CGFloat titleLeftPadding = (buttonSize.width - strSize.width)/2.0 - imageOldSize.width;
            CGFloat titleRightPadding = (buttonSize.width  - strSize.width)/2.0 - imageOldSize.width;
            [self setTitleEdgeInsets:UIEdgeInsetsMake(titleTopPadding, titleLeftPadding, titleBottomPadding, titleRightPadding)];
            
            CGFloat imageTopPadding = (buttonSize.height-strSize.height-middleSpacing-imageSize.height)/2.0;
            CGFloat imageBottomPadding = (buttonSize.height-strSize.height-middleSpacing-imageSize.height)/2.0 + middleSpacing + strSize.height;
            CGFloat imageLeftPadding = (buttonSize.width - imageSize.width)/2.0;
            CGFloat imageRightPadding = (buttonSize.width - imageSize.width)/2.0;
            [self setImageEdgeInsets:UIEdgeInsetsMake(imageTopPadding, imageLeftPadding, imageBottomPadding, imageRightPadding)];
            
            break;
        }
        case LLButtonLayoutImageBottomTitleTop:{
            
            CGFloat titleTopPadding = (buttonSize.height-strSize.height-middleSpacing-imageSize.height)/2.0;
            CGFloat titleBottomPadding = (buttonSize.height-strSize.height-middleSpacing-imageSize.height)/2.0 + middleSpacing + imageSize.height;
            CGFloat titleLeftPadding = (buttonSize.width - strSize.width)/2.0 - imageOldSize.width;
            CGFloat titleRightPadding = (buttonSize.width  - strSize.width)/2.0 - imageOldSize.width;
            [self setTitleEdgeInsets:UIEdgeInsetsMake(titleTopPadding, titleLeftPadding, titleBottomPadding, titleRightPadding)];
            
            CGFloat imageTopPadding = (buttonSize.height-strSize.height-middleSpacing-imageSize.height)/2.0 + strSize.height + middleSpacing;
            CGFloat imageBottomPadding = (buttonSize.height-strSize.height-middleSpacing-imageSize.height)/2.0;
            CGFloat imageLeftPadding = (buttonSize.width - imageSize.width)/2.0;
            CGFloat imageRightPadding = (buttonSize.width - imageSize.width)/2.0;
            [self setImageEdgeInsets:UIEdgeInsetsMake(imageTopPadding, imageLeftPadding, imageBottomPadding, imageRightPadding)];
            
            break;
        }
        default:
            break;
    }
}


@end
