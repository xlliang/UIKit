//
//  CADisplayLink+WeakDisplayLink.m
//  LLUIKit
//
//  Created by 梁先生 on 2018/7/24.
//  Copyright © 2018 liangxl. All rights reserved.
//

#import "CADisplayLink+WeakDisplayLink.h"
#import <objc/Runtime.h>

@implementation CADisplayLink (WeakDisplayLink)

- (void)setExecuteBlock:(LLExecuteDisplayLinkBlock)executeBlock{
    
    objc_setAssociatedObject(self, @selector(executeBlock), [executeBlock copy], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (LLExecuteDisplayLinkBlock)executeBlock{
    
    return objc_getAssociatedObject(self, @selector(executeBlock));
}

+ (CADisplayLink *)displayLinkWithExecuteBlock:(LLExecuteDisplayLinkBlock)block{
    
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(ll_executeDisplayLink:)];
    displayLink.executeBlock = [block copy];
    return displayLink;
}

+ (void)ll_executeDisplayLink:(CADisplayLink *)displayLink{
    
    if (displayLink.executeBlock) {
        displayLink.executeBlock(displayLink);
    }
}

@end
