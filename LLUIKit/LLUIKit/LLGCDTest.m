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
    NSLog(@"syncConcurrent---begin");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"1------%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"2------%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; ++i) {
            NSLog(@"3------%@",[NSThread currentThread]);
        }
    });
    
    NSLog(@"syncConcurrent---end");

}

@end
