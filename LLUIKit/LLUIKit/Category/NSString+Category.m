//
//  NSString+Category.m
//  LLUIKit
//
//  Created by 梁先生 on 2018/6/26.
//  Copyright © 2018年 liangxl. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)

+ (bool)emptyOrNull:(NSString *)string
{
    return  (string == NULL) ||
    ([string isEqual:[NSNull null]]) ||
    ([string isKindOfClass:[NSString class]] && string.length == 0);
}

- (NSString *)trimmedString{
    if([NSString emptyOrNull:self]) return nil;
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)ll_trimmedSpaceCharacter{
    if([NSString emptyOrNull:self]) return nil;
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (CGSize)customSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size{
    if ([NSString emptyOrNull:self])  return CGSizeZero;
    
    CGRect rect = [self boundingRectWithSize:size
                                     options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                  attributes:@{NSFontAttributeName:font}
                                     context:nil];
    return rect.size;
    
}


@end
