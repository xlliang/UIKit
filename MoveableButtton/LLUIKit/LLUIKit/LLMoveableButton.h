//
//  LLMoveableButton.h
//  LLUIKit
//
//  Created by 梁先生 on 2017/9/11.
//  Copyright © 2017年 梁先生. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TapAction)(void);


@interface LLMoveableButton : UIControl

- (instancetype)initWithImage:(UIImage *)image clickedBlock:(TapAction)block;
- (instancetype)initWithFrame:(CGRect)frame buttonImage:(UIImage *)image clickedBlock:(TapAction)block;


@end
