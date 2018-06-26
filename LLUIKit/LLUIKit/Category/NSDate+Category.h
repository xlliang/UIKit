//
//  NSDate+Category.h
//  LLUIKit
//
//  Created by 梁先生 on 2017/10/16.
//  Copyright © 2017年 liangxl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Category)

+ (NSString *)yesterday;

+ (NSString *)today;

+ (NSString *)tomorrow;

+ (NSString *)formatterDate:(NSDate *)date formatString:(NSString *)format;

@end
