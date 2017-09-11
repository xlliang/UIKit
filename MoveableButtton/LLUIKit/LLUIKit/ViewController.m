//
//  ViewController.m
//  LLUIKit
//
//  Created by 梁先生 on 2017/9/11.
//  Copyright © 2017年 梁先生. All rights reserved.
//

#import "ViewController.h"
#import "LLMoveableButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor =[UIColor yellowColor];
    
    LLMoveableButton *bt = [[LLMoveableButton alloc] initWithFrame:CGRectMake(0, 200, 64, 64) buttonImage:[UIImage imageNamed:@"test"] clickedBlock:^{
        NSLog(@"clicked");
    }];
    bt.frame = CGRectMake(0, 200, 64, 64);
    [self.view addSubview:bt];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}


@end
