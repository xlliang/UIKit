//
//  NSArray+Category.h
//  LLUIKit
//
//  Created by 梁先生 on 2018/6/26.
//  Copyright © 2018年 liangxl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Category)

/**
 *  Array -> Json
 */
+ (nullable NSString *)arrayToJson:(NSArray *)array;

/**
 *  Json -> Array
 */
+ (nullable NSMutableArray *)jsonToArray:(NSString *)jsonString;


@end

NS_ASSUME_NONNULL_END
