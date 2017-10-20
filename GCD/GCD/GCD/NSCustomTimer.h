//
//  NSCustomTimer.h
//  GCD
//
//  Created by liangxl on 2017/10/13.
//  Copyright © 2017年 liangxl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCustomTimer : NSObject

+ (void)MMScheduledTimerWithTimeInterval:(NSTimeInterval)ti time:(int)time block:(void (^ __nullable)(int currentTime))callBack;

@end
