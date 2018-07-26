//
//  NSArray+CustomKVC.h
//  LLUIKit
//
//  Created by 梁先生 on 2018/7/26.
//  Copyright © 2018 liangxl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (CustomKVC)

-(id) _javaForKeyPath:(NSString *)keyPath;
-(id) _swfitForKey:(NSString *)keyPath;

@end

NS_ASSUME_NONNULL_END
