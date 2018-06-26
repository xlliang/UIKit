//
//  UIDevice+Category.m
//  LLUIKit
//
//  Created by 梁先生 on 2018/6/26.
//  Copyright © 2018年 liangxl. All rights reserved.
//

#import "UIDevice+Category.h"

@implementation UIDevice (Category)

+ (double)osSystemVersion{
    NSString *version = [UIDevice currentDevice].systemVersion;
    return [version doubleValue];
}

@end
