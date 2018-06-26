//
//  NSMutableDictionary+Category.m
//  LLUIKit
//
//  Created by 梁先生 on 2018/6/26.
//  Copyright © 2018年 liangxl. All rights reserved.
//

#import "NSMutableDictionary+Category.h"

@implementation NSMutableDictionary (Category)

- (id)removeObjectForKey:(id)key{
    if (!key) return nil;
    id value = self[key];
    [self removeObjectForKey:key];
    return value;
}

@end
