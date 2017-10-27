//
//  LLGCDTest.m
//  LLUIKit
//
//  Created by 梁先生 on 2017/9/18.
//  Copyright © 2017年 liangxl. All rights reserved.
//

#import "LLGCDTest.h"

@implementation LLGCDTest

- (void)syncConcurrent{
    
    
    /*
     *函数不是3s执行，而是3s后追加处理到dispatch_queue中
     *函数3s后也不一定会执行，由于Main Queue在主线程的RunLoop中执行，RunLoop执行间隔1/60s, 所以函数执行是在3s-(3+1/60)s执行，不过如果queue中有大量任务追加或者主线程有繁重任务执行，执行时间会更长，因此非严格时间要求，可以使用
    
    CFTimeInterval start = CFAbsoluteTimeGetCurrent();
    NSLog(@"start==%f",start);
    
     //3ull*NSEC_PER_SEC 单位毫微妙
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 3ull*NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        NSLog(@"3s后执行");
    });
    
     */
    
    /*
    //group
     //0:该属性是保留值，目前只需设置为0
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        NSLog(@"block1");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"block2");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"block3");
    });
    //global queue 就是concurrent queue  ，多个线程并行执行，所以追加任务顺序不定，执行时会发生变化，不过ok一定在最后面
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"ok:执行完成3个block");
    });
    
    */
    
    //经过指定的时间或者属于group的处理全部执行完毕之前，执行这个函数的线程是停止的。
    //函数执行结束，返回一个0或者非0  ，0代表group中的任务全部完成，否则还有任务执行
    //dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    
    //栅栏函数：函数前的任务执行结束，执行栅栏函数任务，然后执行函数后的任务
    //dispatch_barrier_sync(queue, ^{});
    
    
    
    
    
    /*
    dispatch_queue_t sync_q = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_sync(sync_q, ^{
        NSLog(@"--非main queue--");
    });
    NSLog(@"end");
     */
    //dispatch_sync queue是main queue 会怎样？
    //运行下面代码会发现出错了，由于产生了死锁问题
    //该源代码在主线程中执行block,并且等待它结束。但是主线程同时也在执行这些源代码，就无法执行追加到dispatch queue的block
    /*
    dispatch_queue_t sync_m = dispatch_get_main_queue();
    dispatch_sync(sync_m, ^{
        NSLog(@"--main queue--");
    });
    */
    
    
    /*
    dispatch_queue_t sync_q = dispatch_queue_create(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(sync_q, ^{
        NSLog(@"-- queue--");
    });
    
    dispatch_queue_t async_m = dispatch_get_main_queue();
    dispatch_async(async_m, ^{
        NSLog(@"--main queue--");
    });
    */
    
    
    
    //按照指定的次数将block追加到dispatch queue中，并等待执行结束
    dispatch_queue_t sync_q = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_apply(10, sync_q, ^(size_t index) {
        NSLog(@"====%zu",index);
    });
    NSLog(@"====done====");
    
    
    
    
    
    
    CFTimeInterval end = CFAbsoluteTimeGetCurrent();
    NSLog(@"end==%f",end);

    
    
//    NSLog(@"syncConcurrent---begin");
//
//    dispatch_queue_t queue = dispatch_get_main_queue();
//
//    dispatch_sync(queue, ^{
//        for (int i = 0; i < 2; ++i) {
//            NSLog(@"1------%@",[NSThread currentThread]);
//        }
//    });
//    dispatch_sync(queue, ^{
//        for (int i = 0; i < 2; ++i) {
//            NSLog(@"2------%@",[NSThread currentThread]);
//        }
//    });
//    dispatch_sync(queue, ^{
//        for (int i = 0; i < 2; ++i) {
//            NSLog(@"3------%@",[NSThread currentThread]);
//        }
//    });
//
//    NSLog(@"syncConcurrent---end");

}

@end
