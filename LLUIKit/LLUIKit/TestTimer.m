//
//  TestTimer.m
//  LLUIKit
//
//  Created by 梁先生 on 2018/7/24.
//  Copyright © 2018 liangxl. All rights reserved.
//

#import "TestTimer.h"

@implementation TestTimer

-(void)dealloc {
    [self.timer invalidate];
    self.timer = nil;
    
    NSLog(@"%s", __func__);
}

- (void)startTimer {
    if (self.timer.isValid) {
        return;
    }
    else {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onTimeFire) userInfo:nil repeats:YES];
        //              __weak TTObject* wkself = self;
        //      self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:wkself selector:@selector(onTimeFire) userInfo:nil repeats:YES];
    }
}

- (void)stopTimer {
    if (self.timer) {
        [self.timer invalidate];
    }
}

- (void)onTimeFire {
    NSLog(@"%s", __func__);
}


@end
