//
//  UIFont+Category.m
//  LLUIKit
//
//  Created by 梁先生 on 2018/6/26.
//  Copyright © 2018年 liangxl. All rights reserved.
//

#import "UIFont+Category.h"
#import "UIDevice+Category.h"

@implementation UIFont (Category)

+ (UIFont *)pingFangSemiboldWithSize:(CGFloat)fontSize{
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    if([UIDevice osSystemVersion]>=9.0){
        font = [UIFont fontWithName:@"PingFangSC-Semibold" size:fontSize];
    }
    return font;
}

+ (UIFont *)pingFangMediumWithSize:(CGFloat)fontSize{
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    if([UIDevice osSystemVersion]>=9.0){
        font = [UIFont fontWithName:@"PingFangSC-Medium" size:fontSize];
    }
    return font;
}

+ (UIFont *)pingFangRegularWithSize:(CGFloat)fontSize{
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    if([UIDevice osSystemVersion]>=9.0){
        font = [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize];
    }
    return font;
}

@end
