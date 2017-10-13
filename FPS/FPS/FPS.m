//
//  FPS.m
//  FPS
//
//  Created by 梁先生 on 2017/10/11.
//  Copyright © 2017年 梁先生. All rights reserved.
//

#import "FPS.h"

@interface FPS(){
    NSTimeInterval _lastTime;
    NSUInteger _count;
}
@property (nonatomic, strong) CADisplayLink *displayLink;
@end


@implementation FPS
- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        self.font = [UIFont systemFontOfSize:12];
        self.textColor = [UIColor redColor];
        self.textAlignment = NSTextAlignmentCenter;
        
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLink:)];
        [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}
- (void)displayLink:(CADisplayLink *)displayLink
{
    if (_lastTime == 0) {
        _lastTime = self.displayLink.timestamp;
        return;
    }
    _count++;
    NSTimeInterval timeout = self.displayLink.timestamp - _lastTime;
    if (timeout < 1) return;
    _lastTime = self.displayLink.timestamp;
    float fps = _count / timeout;
    _count = 0;
    self.text = [NSString stringWithFormat:@"%d",(int)fps];
}

- (void)invalidateDisplayLink
{
    [self.displayLink invalidate];
    self.displayLink = nil;
    [self removeFromSuperview];
}

@end
