//
//  SecondViewController.m
//  LLUIKit
//
//  Created by 梁先生 on 2018/7/24.
//  Copyright © 2018 liangxl. All rights reserved.
//
#import "TestTimer.h"

#import "SecondViewController.h"

#import "LLWeakProxy.h"

@interface SecondViewController ()
@property (nonatomic, strong) TestTimer *timer1;

@property (strong, nonatomic) NSTimer *timer;

@property (nonatomic,strong) CADisplayLink *displayLink;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    self.timer = [[TestTimer alloc] init];
//    [self.timer startTimer];
    /*
     *  循环引用了，造成内存泄露
     */
    
    //test 1 无效
    //__weak typeof(self) weakSelf = self;
    
    //test 2 dealloc 中 [self.timer invalidate] 无效,原因循环引用了dealloc不会调用了
    //可以根据情况在viewWillDisappear and viewDidDisappear 做清理
    
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
//                                                  target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    
    
    //新的ios10.0方法不会有循环引用的问题
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"test");
//    }];
//
    
    //timer 类似
    self.displayLink = [CADisplayLink displayLinkWithTarget:[LLWeakProxy proxyWithTarget:self] selector:@selector(executeDispalyLink:)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    //...
    


}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}

- (void)executeDispalyLink:(id)sender{
    NSLog(@"CADisplayLink");
}

- (void)timerAction:(id)sender{
    NSLog(@"NSTimer");
}

- (void)dealloc{
//    [self.timer stopTimer];
//    self.timer = nil;
    
//    [self.timer invalidate];
//    self.timer = nil;
    
    [self.displayLink invalidate];
    
    NSLog(@"SecondViewController");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
