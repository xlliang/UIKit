//
//  LLGCDTest.m
//  LLUIKit
//
//  Created by 梁先生 on 2017/9/18.
//  Copyright © 2017年 liangxl. All rights reserved.
//

#import "LLGCDTest.h"

@implementation LLGCDTest

#pragma mark - 串行队列同步和串行队列异步
//串行队列同步
- (void)serialQueueSyncMethod{
    //创建队列
    dispatch_queue_t queue = dispatch_queue_create("serialQueueSyncMethod", DISPATCH_QUEUE_SERIAL);
    //执行任务
    for (int i = 0; i < 6; i++) {
        NSLog(@"mainThread--->%d",i);
        dispatch_sync(queue, ^{
            NSLog(@"Current Thread=%@---->%d-----",[NSThread currentThread],i);
        });
    }
    NSLog(@"串行队列同步end");
}

//串行队列异步
- (void)serialQueueAsyncMethod{
    dispatch_queue_t queue = dispatch_queue_create("serialQueueAsyncMethod", DISPATCH_QUEUE_SERIAL);
    for (int i = 0; i < 6; i++) {
        NSLog(@"mainThread--->%d",i);
        dispatch_async(queue, ^{
            NSLog(@"Current Thread=%@---->%d-----",[NSThread currentThread],i);
        });
    }
    NSLog(@"串行队列异步end");
}

//串行队列
-(void)serialQueue{
    //串行队列创建方式
    dispatch_queue_t queue1 = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue2 = dispatch_queue_create("queue", NULL);
   
    /*
     1:串行同步，不开辟新线程，在主线程执行，所有block任务同步的
     2:串行一步，开辟新线程，但是队列指只开辟一个新线程，所有block任务在新线程中同步执行
     都会按照先进先出的方式，顺序调度队列中的任务，不论队列中是同步还是异步任务，都会等待前一个执行结束，在调度后一个
    */
    
//    [self serialQueueSyncMethod];
    [self serialQueueAsyncMethod];
}


#pragma mark - 并行队列同步和并行队列异步
//并行队列同步
- (void)concurrentQueueSyncMethod{
    dispatch_queue_t queue = dispatch_queue_create("concurrentQueueSyncMethod", DISPATCH_QUEUE_CONCURRENT);
    
    for (int i = 0; i < 6; i++) {
        NSLog(@"mainThread--->%d",i);
        dispatch_sync(queue, ^{
            NSLog(@"Current Thread=%@---->%d-----",[NSThread currentThread],i);
        });
    }
    NSLog(@"并行队列同步end");
}

//并行队列异步
- (void)concurrentQueueAsyncMethod{
    dispatch_queue_t queue = dispatch_queue_create("concurrentQueueAsyncMethod", DISPATCH_QUEUE_CONCURRENT);
    
    for (int i = 0; i < 6; i++) {
        NSLog(@"mainThread--->%d",i);
        dispatch_async(queue, ^{
            NSLog(@"Current Thread=%@---->%d-----",[NSThread currentThread],i);
        });
    }
    
    NSLog(@"并行队列异步end");
}

- (void)concurrentQueue{
    //创建队列
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    /*
     并发队列同步执行和串行队列同步执行一样，都不会开辟新线程，block任务之间是同步执行的。
     并发队列异步执行开辟了多个线程，并且执行顺序也不是顺序执行。因为异步开多线程的代名词，并发是开多条线程的代名词
     有多个线程，操作进来之后它会将这些队列安排在可用的处理器上，同时保证先进来的任务优先处理。
     以先进先出的方式，并发调度队列中的任务执行
     如果当前调度的任务是同步执行的，会等待任务执行完成后，再调度后续的任务
     如果当前调度的任务是异步执行的，同时底层线程池有可用的线程资源，会再新的线程调度后续任务的执行
     */
    
    [self concurrentQueueSyncMethod];
    [self concurrentQueueAsyncMethod];
}

- (void)syncConcurrent{
//    [self serialQueue];
//    [self concurrentQueue];
    
    
    {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_group_t group = dispatch_group_create();
        for (int i = 0; i < 6; i++) {
            dispatch_group_async(group, queue, ^{
                NSLog(@"current Thread = %@----->%d",[NSThread currentThread],i);
            });
        }
        
        dispatch_group_notify(group, dispatch_get_main_queue(), ^{
            NSLog(@"current Thread = %@----->这是最后执行",[NSThread   currentThread]);
        });

    }
    
    
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
//    dispatch_queue_t sync_q = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_apply(10, sync_q, ^(size_t index) {
//        NSLog(@"====%zu",index);
//    });
//    NSLog(@"====done====");
//    
//    
//    
//    
//    
//    
//    CFTimeInterval end = CFAbsoluteTimeGetCurrent();
//    NSLog(@"end==%f",end);

    
    
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
