//
//  NSTimer+WeakTimer.h
//  LLUIKit
//
//  Created by 梁先生 on 2018/7/24.
//  Copyright © 2018 liangxl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^LLExecuteTimerBlock) (NSTimer *timer);

@interface NSTimer (WeakTimer)

+ (NSTimer *)ll_scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval executeBlock:(LLExecuteTimerBlock)block repeats:(BOOL)repeats;


@end

NS_ASSUME_NONNULL_END
