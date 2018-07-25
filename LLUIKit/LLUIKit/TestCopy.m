//
//  TestCopy.m
//  LLUIKit
//
//  Created by 梁先生 on 2018/7/18.
//  Copyright © 2018 liangxl. All rights reserved.
//

#import "TestCopy.h"


@implementation TestCopy

- (id)copyWithZone:(NSZone *)zone{
//    TestCopy *copy = [[TestCopy alloc] init]; //这种写法会有什么问题，什么情况下出问题
    TestCopy *copy = [[[self class] allocWithZone:zone] init];

    copy.age = self.age;
    copy.name = self.name;
    
    return copy;
    
}

@end

@implementation Person

- (id)copyWithZone:(NSZone *)zone{
    Person *obj = [super copyWithZone:zone];
    obj.sex = self.sex;
    return obj;
}

@end
