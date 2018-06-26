//
//  NSDictionary+Category.m
//  LLUIKit
//
//  Created by 梁先生 on 2018/6/26.
//  Copyright © 2018年 liangxl. All rights reserved.
//

#import "NSDictionary+Category.h"

@implementation NSDictionary (Category)

- (BOOL)containsObjectForKey:(id)key {
    if (!key) return NO;
    return self[key] != nil;
}


static NSNumber *NSNumberFromID(id value) {
    static NSCharacterSet *dot;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dot = [NSCharacterSet characterSetWithRange:NSMakeRange('.', 1)];
    });
    if (!value || value == [NSNull null]) return nil;
    if ([value isKindOfClass:[NSNumber class]]) return value;
    if ([value isKindOfClass:[NSString class]]) {
        NSString *lower = ((NSString *)value).lowercaseString;
        if ([lower isEqualToString:@"true"] || [lower isEqualToString:@"yes"]) return @(YES);
        if ([lower isEqualToString:@"false"] || [lower isEqualToString:@"no"]) return @(NO);
        if ([lower isEqualToString:@"nil"] || [lower isEqualToString:@"null"]) return nil;
        if ([(NSString *)value rangeOfCharacterFromSet:dot].location != NSNotFound) {
            return @(((NSString *)value).doubleValue);
        } else {
            return @(((NSString *)value).longLongValue);
        }
    }
    return nil;
}


- (NSNumber *)numberValueForKey:(NSString *)key{
    if (!key) return nil;
    id value = self[key];
    if (!value || value == [NSNull null]) return nil;
    if ([value isKindOfClass:[NSNumber class]]) return value;
    if ([value isKindOfClass:[NSString class]]) return NSNumberFromID(value);
    return nil;
}

- (NSString *)stringValueForKey:(NSString *)key{
    if (!key) return nil;
    id value = self[key];
    if (!value || value == [NSNull null]) return nil;
    if ([value isKindOfClass:[NSString class]]) return value;
    if ([value isKindOfClass:[NSNumber class]]) return ((NSNumber *)value).description;
    return nil;
}


@end
