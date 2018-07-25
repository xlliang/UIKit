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
#import "SecondViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor =[UIColor blueColor];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 30);
    [self.view addSubview:button];
    [button setTitle:@"second" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    
   
    
//    [self moveableButtonTest];
//    [self singletonTest];
//    [self dateTest];
//    [self gcdTest];
//
//    [[NSStringTest alloc] testString];
    
//    [LoopTest testArray];
    
   

//    [LoopTest testDict];
    
    NSMutableArray *arr = [@[@(11),@(2),@(3),@(4),@(5)] mutableCopy];
    NSInteger len = arr.count;
    for (int i = 0; i< len-1; i++){
//        NSLog(@"==i===%d",i);
        for (int j =0; j<len-1-i; j++){
//            NSLog(@"==j===%d",j);

            if([arr[j] intValue]>[arr[j+1] intValue]){
                
//                NSLog(@"===%@===%@",arr[j],arr[j+1]);
                
                NSNumber *temp = arr[j+1];
                arr[j+1] = arr[j];
                arr[j] = temp;
                
                
            }
            
//            NSLog(@"1111===%@",arr);
        }
    }
    
//    NSLog(@"===%@",arr);
    
    
}

- (void)tap{
    SecondViewController *vc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
