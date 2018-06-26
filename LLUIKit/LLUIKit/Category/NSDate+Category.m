//
//  NSDate+Category.m
//  LLUIKit
//
//  Created by 梁先生 on 2017/10/16.
//  Copyright © 2017年 liangxl. All rights reserved.
//

#import "NSDate+Category.h"

@implementation NSDate (Category)

+ (NSString *)yesterday{
    NSDate *date = [NSDate date];
    NSDate *lastDay = [NSDate dateWithTimeInterval:-24*60*60 sinceDate:date];
    return [NSDate formatterDate:lastDay formatString:@"yyyyMMdd"];
}

+ (NSString *)today{
    NSDate *date = [NSDate date];
    return [NSDate formatterDate:date formatString:@"yyyyMMdd"];
}

+ (NSString *)tomorrow{
    NSDate *date = [NSDate date];
    NSDate *nextDay = [NSDate dateWithTimeInterval:24*60*60 sinceDate:date];
    return [NSDate formatterDate:nextDay formatString:@"yyyyMMdd"];
}

+ (NSString *)formatterDate:(NSDate *)date formatString:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

@end
