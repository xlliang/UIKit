//
//  ViewController.m
//  GCD
//
//  Created by liangxl on 2017/10/13.
//  Copyright © 2017年 liangxl. All rights reserved.
//

#import "ViewController.h"

#import<libkern/OSAtomic.h>
#import "stdatomic.h"
#import "NSCustomTimer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(12.0/*延迟执行时间*/ * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        NSLog(@"daskdka");
    });
    
 
    
    
    [NSCustomTimer MMScheduledTimerWithTimeInterval:1.0 time:10 block:^(int currentTime){
        NSLog(@"callback==%d==%@",currentTime,[NSThread currentThread]);
        //刷新UI，需要切换到主线程中
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
