//
//  NSURL+Category.m
//  LLUIKit
//
//  Created by 梁先生 on 2018/6/26.
//  Copyright © 2018年 liangxl. All rights reserved.
//

#import "NSURL+Category.h"
#import "NSString+Category.h"

@implementation NSURL (Category)

+ (NSURL *)urlWithString:(NSString *)stringUrl{
    if([NSString emptyOrNull:stringUrl]) return nil;
    return [NSURL URLWithString:stringUrl];
}

@end
