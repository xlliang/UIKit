//
//  NSArray+CustomKVC.m
//  LLUIKit
//
//  Created by 梁先生 on 2018/7/26.
//  Copyright © 2018 liangxl. All rights reserved.
//

#import "NSArray+CustomKVC.h"

@implementation NSArray (CustomKVC)

-(id)_javaForKeyPath:(NSString *)keyPath{
    return @"custom kvc";
}

-(id) _swfitForKey:(NSString *)keyPath{
    return @"custom kvc swfit";
    
}


@end
