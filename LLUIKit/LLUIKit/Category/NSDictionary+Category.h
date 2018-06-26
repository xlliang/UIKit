//
//  NSDictionary+Category.h
//  LLUIKit
//
//  Created by 梁先生 on 2018/6/26.
//  Copyright © 2018年 liangxl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Category)

/**
 * 指定Key是否有Value
 */
- (BOOL)containsObjectForKey:(id)key;


///=============================================================================
/// Dictionary Value Getter
///=============================================================================

- (nullable NSNumber *)numberValueForKey:(NSString *)key;

- (nullable NSString *)stringValueForKey:(NSString *)key;

@end
