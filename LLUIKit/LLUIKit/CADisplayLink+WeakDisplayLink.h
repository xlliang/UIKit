//
//  CADisplayLink+WeakDisplayLink.h
//  LLUIKit
//
//  Created by 梁先生 on 2018/7/24.
//  Copyright © 2018 liangxl. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^LLExecuteDisplayLinkBlock) (CADisplayLink *displayLink);


@interface CADisplayLink (WeakDisplayLink)

@property (nonatomic,copy)LLExecuteDisplayLinkBlock executeBlock;

+ (CADisplayLink *)displayLinkWithExecuteBlock:(LLExecuteDisplayLinkBlock)block;

@end

NS_ASSUME_NONNULL_END
