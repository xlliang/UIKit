//
//  NSArray+Category.m
//  LLUIKit
//
//  Created by 梁先生 on 2018/6/26.
//  Copyright © 2018年 liangxl. All rights reserved.
//

#import "NSArray+Category.h"
#import "NSString+Category.h"

@implementation NSArray (Category)

+ (NSString *)arrayToJson:(NSArray *)array{
    if(array == nil || array.count < 1) return nil;
    
    NSError *err;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&err];
    
    if([jsonData length] > 0 && err == nil){
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }else{
        return nil;
    }
}

+ (NSMutableArray *)jsonToArray:(NSString *)jsonString{
    if ([NSString emptyOrNull:jsonString]) return nil;
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData
                                                     options:NSJSONReadingMutableContainers
                                                       error:&err];
    if(err) return nil;
    return [array mutableCopy];
}

@end
