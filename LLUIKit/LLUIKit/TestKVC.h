//
//  TestKVC.h
//  LLUIKit
//
//  Created by 梁先生 on 2018/7/26.
//  Copyright © 2018 liangxl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Book : NSObject

@property (nonatomic,copy)  NSString* name;
@property (nonatomic,assign) float price;

@end

@interface TestKVC : NSObject
- (void)testStart;
@end

NS_ASSUME_NONNULL_END
