//
//  NSCustomTimer.m
//  GCD
//
//  Created by liangxl on 2017/10/13.
//  Copyright © 2017年 liangxl. All rights reserved.
//

#import "NSCustomTimer.h"

@implementation NSCustomTimer

+ (void)MMScheduledTimerWithTimeInterval:(NSTimeInterval)ti time:(int)time block:(void (^ __nullable)(int currentTime))callBack{
    
    __block int32_t timeOutCount = time;
    
    //获取全局队列
    dispatch_queue_t global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    global = dispatch_get_main_queue();
    
    //创建一个定时器，并将定时器的任务交给全局队列执行(并行，不会造成主线程阻塞)
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, global);
    
    // 设置触发的间隔时间
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, ti/*代表设置定时器触发的时间间隔为1s*/ * NSEC_PER_SEC, 0);
    
    //设置定时器的触发的回调
    dispatch_source_set_event_handler(timer, ^{
        //        OSAtomicDecrement32(&timeOutCount);
        timeOutCount--;
//        NSLog(@"==custom===%d",timeOutCount);
        
        callBack(timeOutCount);
        if (timeOutCount == 0) {
            NSLog(@"timersource cancel");
            dispatch_source_cancel(timer);
        }
    });
    
    dispatch_source_set_cancel_handler(timer, ^{
        NSLog(@"timersource cancel handle block");
    });
    
    dispatch_resume(timer);
    
    
}

- (void)dealloc{
    NSLog(@"NSCustomTimer dealloc");
}

@end
