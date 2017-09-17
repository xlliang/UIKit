//
//  LLSingleton.h
//  LLUIKit
//
//  Created by liangxl on 2017/9/18.
//  Copyright © 2017年 梁先生. All rights reserved.
//

#ifndef LLSingleton_h
#define LLSingleton_h

/*

 性能不如GCD ,建议使用GCD
 
static id _instance;
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{    @synchronized(self) {        if (_instance == nil) {
    _instance = [super allocWithZone:zone];
}
}    return _instance;
}
+ (instancetype)sharedInstance
{    @synchronized(self) {        if (_instance == nil) {
    _instance = [[self alloc] init];
}
}    return _instance;
}
- (id)copyWithZone:(NSZone *)zone
{    return _instance;
}

 */

/*
 * GCD 保证线程安全
 */

#define SingletonH(name) + (instancetype)shared##name;

#define SingletonM(name) \
static id _instance; \
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
}\
\
- (id)mutableCopyWithZone:(NSZone *)zone { \
return _instance; \
}


#endif /* LLSingleton_h */
