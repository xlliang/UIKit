//
//  ViewController.m
//  DATE
//
//  Created by 梁先生 on 2017/7/28.
//  Copyright © 2017年 梁先生. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    NSDate *date = [NSDate date];
//    NSLog(@"date = %@",date); //零时区时间
    

//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
//    NSString *dateStr = [formatter stringFromDate:date];
//    NSLog(@"dateStr = %@", dateStr);//东八区的北京时间
    
    
    
    
//    NSDate *date = [NSDate date];
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    formatter.timeZone =  [NSTimeZone timeZoneWithName:@"GMT"];//零区时间
//    formatter.timeZone =  [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];//东八区时间
//    NSString *dateStr = [formatter stringFromDate:date];
//    NSLog(@"字符串时间 = %@", dateStr); 获取指定时区时间
    
    
    
//    NSArray *zones = [NSTimeZone knownTimeZoneNames];
//    for (NSString *zone in zones) {
//        NSLog(@"时区名 = %@", zone);
//    }
    
    
    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
//    NSDate *newDate = [formatter dateFromString:@"2017-07-28 14:28:18 +0000"];
//    NSDate *newDate1 = [formatter dateFromString:@"2017-07-28 14:28:18 +0800"];
//    NSLog(@"newDate = %@ \n newDate1 =%@", newDate,newDate1);
    
    
//    NSDate *date = [NSDate date];
//    
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
//    
//    NSInteger interval = [zone secondsFromGMTForDate:date];
//    
//    NSDate *localDate = [date  dateByAddingTimeInterval:interval];
//    
//    NSLog(@"localDate = %@",localDate);
    
    
//    NSDate *date = [NSDate date];
//    
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
//    
//    NSInteger interval = [zone secondsFromGMTForDate:date];
//    
//    NSDate *localDate = [date dateByAddingTimeInterval:interval];
//    
//    
//    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    
//    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    
//    formatter.timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
//    
//    NSString *dateStr = [formatter stringFromDate:localDate];
//    
//    NSLog(@"字符串时间 = %@", dateStr);
    
//    NSDate *date = [NSDate date];
//    
//    NSTimeInterval timeIn = [date timeIntervalSince1970];
//    
//    NSLog(@"时间戳 = %.0f", timeIn);
    
//    NSDate *date = [NSDate date];
//    
//    NSTimeInterval timeIn = [date timeIntervalSince1970];
//    
//    NSDate *newDate = [NSDate dateWithTimeIntervalSince1970:timeIn];
//    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
//    
//    NSString *newTime = [dateFormatter stringFromDate:newDate];
//    
//    NSLog(@"初始化时间 = %@，时间戳=%.0f，时间戳转为NSDate时间 = %@，转为字符串时间 = %@", date, timeIn, newDate, newTime);
    
    
    
    
    
//    NSDate *date = [NSDate date];
//    
//    NSLog(@"系统零时区NSDate时间 = %@", date);
//    
//    NSTimeInterval timeIn = [date timeIntervalSince1970];
//    
//    NSLog(@"系统零时区NSDate时间转化为时间戳 = %.0f", timeIn);
//    
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
//    
//    NSInteger interval = [zone secondsFromGMTForDate:date];
//    
//    NSDate *localDate = [date  dateByAddingTimeInterval:interval];
//    
//    NSLog(@"转化为本地NSDate时间 = %@", localDate);
//    
//    NSTimeInterval timeIn2 = [localDate timeIntervalSince1970];
//    
//    NSLog(@"本地NSDate时间转化为时间戳 = %.0f", timeIn2);
//    
//    NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:timeIn];
//    
//    NSDate *detaildate2 = [NSDate dateWithTimeIntervalSince1970:timeIn2];
//    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
//    
//    NSString *newTime = [dateFormatter stringFromDate:detaildate];
//    
//    NSString *newTime2 = [dateFormatter stringFromDate:detaildate2];
//    
//    NSLog(@"最终转为字符串时间1 = %@， 时间2 = %@", newTime, newTime2);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
