//
//  ViewController.m
//  LLUIKit
//
//  Created by 梁先生 on 2017/9/11.
//  Copyright © 2017年 梁先生. All rights reserved.
//

#import "ViewController.h"
#import "LLMoveableButton.h"
#import "LLSingletonTest.h"
#import "LLDateTest.h"
#import "LLGCDTest.h"
#import "NSStringTest.h"
#import "LoopTest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor =[UIColor yellowColor];
    
//    [self moveableButtonTest];
//    [self singletonTest];
//    [self dateTest];
    [self gcdTest];
//
//    [[NSStringTest alloc] testString];
    
//    [LoopTest testArray];
    
   

//    [LoopTest testDict];
}

#pragma mark - 可拖动按钮测试

-(void)moveableButtonTest{
    LLMoveableButton *bt = [[LLMoveableButton alloc] initWithFrame:CGRectMake(0, 200, 64, 64) buttonImage:[UIImage imageNamed:@"test"] clickedBlock:^{
        NSLog(@"clicked");
    }];
    bt.frame = CGRectMake(0, 200, 64, 64);
    [self.view addSubview:bt];
    
}

#pragma mark - 单例测试

-(void)singletonTest{
    for (int i=0; i<3; i++) {
        LLSingletonTest *test = [[LLSingletonTest alloc] init];
        
        NSLog(@"单例测试：%@",test);
    }
    
}

- (void)dateTest{
    LLDateTest *test = [[LLDateTest alloc] init];
    [test testDate];
    
}

- (void)gcdTest{
    LLGCDTest *test = [LLGCDTest new];
    [test syncConcurrent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}


@end
