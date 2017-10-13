//
//  LLDateTest.m
//  LLUIKit
//
//  Created by liangxl on 2017/9/18.
//  Copyright © 2017年 liangxl. All rights reserved.
//

#import "LLDateTest.h"

@implementation LLDateTest

- (void)testDate {
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSDate *date = [NSDate date];
    NSLog(@"date = %@",date); //零时区时间
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    NSString *dateStr = [formatter stringFromDate:date];
    NSLog(@"dateStr = %@", dateStr);//东八区的北京时间
    
    
    
    
    date = [NSDate date];
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    formatter.timeZone =  [NSTimeZone timeZoneWithName:@"GMT"];//零区时间
    formatter.timeZone =  [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];//东八区时间
    dateStr = [formatter stringFromDate:date];
    NSLog(@"字符串时间 = %@", dateStr); //获取指定时区时间
    
    
    
    NSArray *zones = [NSTimeZone knownTimeZoneNames];
    for (NSString *zone in zones) {
        NSLog(@"时区名 = %@", zone);
    }
    
    
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    NSDate *newDate = [formatter dateFromString:@"2017-07-28 14:28:18 +0000"];
    NSDate *newDate1 = [formatter dateFromString:@"2017-07-28 14:28:18 +0800"];
    NSLog(@"newDate = %@ \n newDate1 =%@", newDate,newDate1);
    
    
    date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate *localDate = [date  dateByAddingTimeInterval:interval];
    NSLog(@"localDate = %@",localDate);
    
    
    date = [NSDate date];
    zone = [NSTimeZone systemTimeZone];
    interval = [zone secondsFromGMTForDate:date];
    localDate = [date dateByAddingTimeInterval:interval];
    
    
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    dateStr = [formatter stringFromDate:localDate];
    NSLog(@"字符串时间 = %@", dateStr);
    
    
    
    
    date = [NSDate date];
    NSTimeInterval timeIn = [date timeIntervalSince1970];
    NSLog(@"时间戳 = %.0f", timeIn);
    
    
    date = [NSDate date];
    timeIn = [date timeIntervalSince1970];
    newDate = [NSDate dateWithTimeIntervalSince1970:timeIn];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    NSString *newTime = [dateFormatter stringFromDate:newDate];
    NSLog(@"初始化时间 = %@，时间戳=%.0f，时间戳转为NSDate时间 = %@，转为字符串时间 = %@", date, timeIn, newDate, newTime);
    
    
    
    
    
    date = [NSDate date];
    NSLog(@"系统零时区NSDate时间 = %@", date);
    timeIn = [date timeIntervalSince1970];
    NSLog(@"系统零时区NSDate时间转化为时间戳 = %.0f", timeIn);
    zone = [NSTimeZone systemTimeZone];
    interval = [zone secondsFromGMTForDate:date];
    localDate = [date  dateByAddingTimeInterval:interval];
    NSLog(@"转化为本地NSDate时间 = %@", localDate);
    NSTimeInterval timeIn2 = [localDate timeIntervalSince1970];
    NSLog(@"本地NSDate时间转化为时间戳 = %.0f", timeIn2);
    NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:timeIn];
    NSDate *detaildate2 = [NSDate dateWithTimeIntervalSince1970:timeIn2];
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    newTime = [dateFormatter stringFromDate:detaildate];
    NSString *newTime2 = [dateFormatter stringFromDate:detaildate2];
    NSLog(@"最终转为字符串时间1 = %@， 时间2 = %@", newTime, newTime2);
}

@end
