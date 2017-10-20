//
//  NSStringTest.m
//  LLUIKit
//
//  Created by liangxl on 2017/10/20.
//  Copyright © 2017年 liangxl. All rights reserved.
//

#import "NSStringTest.h"
 #import <objc/runtime.h>

@implementation NSStringTest

- (void)testString{
    
    NSMutableString *mStr = [NSMutableString stringWithFormat:@"test"];
    self.name1 = mStr;
    self.name2 = mStr;
    [mStr appendString:@"test"];//name1的修饰符为copy时，name1的结果为test
    NSLog(@"%@",mStr);//name的修饰符为strong时，name的结果为test+test
    NSLog(@"%@",self.name1);
    NSLog(@"%@",self.name2);
    
    
    NSString *str1 = @"1234567890";
    printLog(str1);
    
    NSString *str2 = [NSString stringWithString:@"1234567890"];
    printLog(str2);

    
    NSString *str3 = [NSString stringWithFormat:@"1234567890"];
    printLog(str3);
    

    NSString *str11 = @"a";
    printLog(str11);

    
    NSString *str13 = [str11 copy];
    printLog(str13);
    
    NSString *str14 = [str11 mutableCopy];
    printLog(str14);

    
}

void printLog(NSString *s){
    NSLog(@"%@ -> %p :",[s class], s);

}

@end
