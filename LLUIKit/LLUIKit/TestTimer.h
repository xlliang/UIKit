//
//  TestTimer.h
//  LLUIKit
//
//  Created by 梁先生 on 2018/7/24.
//  Copyright © 2018 liangxl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestTimer : NSObject

@property (nonatomic, strong) NSTimer *timer;



- (void)startTimer;
- (void)stopTimer;

@end

NS_ASSUME_NONNULL_END
