//
//  LLMoveableButton.m
//  LLUIKit
//
//  Created by 梁先生 on 2017/9/11.
//  Copyright © 2017年 梁先生. All rights reserved.
//

#import "LLMoveableButton.h"

@interface LLMoveableButton()

@property (nonatomic,copy)    TapAction   actionBlock;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation LLMoveableButton

- (instancetype)initWithFrame:(CGRect)frame buttonImage:(UIImage *)image clickedBlock:(TapAction)block{
    
    if (self = [super initWithFrame:frame]) {
        self.actionBlock = block;
        _imageView = [[UIImageView alloc] initWithImage:image];
        _imageView.frame = self.bounds;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
        _imageView.userInteractionEnabled = YES;
        [self addSubview:_imageView];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
        [self addGestureRecognizer:tapGesture];
        
    }
    return self;
}

#pragma mark - --------------------初始化--------------------
- (instancetype)initWithImage:(UIImage *)image clickedBlock:(TapAction)block {
    return [self initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height) buttonImage:image clickedBlock:block];
}

#pragma mark - --------------------System--------------------
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint prePoint = [touch previousLocationInView:self.superview];
    CGPoint nowPoint = [touch locationInView:self.superview];
    CGPoint offset = CGPointMake(nowPoint.x-prePoint.x, nowPoint.y-prePoint.y);
    CGFloat x = self.center.x+offset.x;
    CGFloat y = self.center.y+offset.y;
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    
    CGFloat viewWidth = self.bounds.size.width/2;
    CGFloat viewHeight = self.bounds.size.height/2;
    
    if (x<viewWidth) {
        x=viewWidth;
    }else if(x>width-viewWidth){
        x = width-viewWidth;
    }
    
    if (y<viewHeight) {
        y=viewHeight;
    }else if(y>height-viewHeight){
        y = height-viewHeight;
    }
    
    self.center = CGPointMake(x, y);
}

- (void)handleTapGesture:(UITapGestureRecognizer *)sender
{
    if (self.actionBlock) {
        self.actionBlock();
    }
}
@end
