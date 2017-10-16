//
//  NSDate+Category.h
//  LLUIKit
//
//  Created by 梁先生 on 2017/10/16.
//  Copyright © 2017年 liangxl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Category)

+ (NSString *)ll_yesterday;

+ (NSString *)ll_today;

+ (NSString *)ll_tomorrow;

+ (NSString *)ll_formatterDate:(NSDate *)date formatString:(NSString *)format;

@end
