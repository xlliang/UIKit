//
//  NSTimer+WeakTimer.m
//  LLUIKit
//
//  Created by 梁先生 on 2018/7/24.
//  Copyright © 2018 liangxl. All rights reserved.
//

#import "NSTimer+WeakTimer.h"

@implementation NSTimer (WeakTimer)

+ (NSTimer *)ll_scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval executeBlock:(LLExecuteTimerBlock)block repeats:(BOOL)repeats{
    
    NSTimer *timer = [self scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(ll_executeTimer:) userInfo:[block copy] repeats:repeats];
    return timer;
}

+ (void)ll_executeTimer:(NSTimer *)timer{
    
    LLExecuteTimerBlock block = timer.userInfo;
    if (block) {
        block(timer);
    }
}

@end
