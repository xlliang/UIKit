//
//  NSString+Category.h
//  LLUIKit
//
//  Created by 梁先生 on 2018/6/26.
//  Copyright © 2018年 liangxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSString (Category)

/**
 * 判断字串是否为空
 * @return BOOL
 */
+ (BOOL)emptyOrNull:(NSString *)string;


/**
 *  删除输入字符串的头尾的空白符号 Ex:@" 1 2 "
 *  @return 删除头尾的空白符号的字符串 Ex:@"1 2"
 */
- (nullable NSString *)trimmedString;

/**
 *  删除字符串中空格  Ex:@"1 2"
 *  @return 删除头尾的空白符号的字符串 Ex:@"12"
 */
- (nullable NSString *)trimmedSpaceCharacter;

/**
 *  文本的宽高
 */
- (CGSize)customSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;


@end

NS_ASSUME_NONNULL_END
