//
//  NSDate+Category.m
//  LLUIKit
//
//  Created by 梁先生 on 2017/10/16.
//  Copyright © 2017年 liangxl. All rights reserved.
//

#import "NSDate+Category.h"

@implementation NSDate (Category)

+ (NSString *)ll_yesterday{
    NSDate *date = [NSDate date];
    NSDate *lastDay = [NSDate dateWithTimeInterval:-24*60*60 sinceDate:date];
    return [NSDate ll_formatterDate:lastDay formatString:@"yyyyMMdd"];
}

+ (NSString *)ll_today{
    NSDate *date = [NSDate date];
    return [NSDate ll_formatterDate:date formatString:@"yyyyMMdd"];
}

+ (NSString *)ll_tomorrow{
    NSDate *date = [NSDate date];
    NSDate *nextDay = [NSDate dateWithTimeInterval:24*60*60 sinceDate:date];
    return [NSDate ll_formatterDate:nextDay formatString:@"yyyyMMdd"];
}

+ (NSString *)ll_formatterDate:(NSDate *)date formatString:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

@end
