//
//  LoopTest.m
//  LLUIKit
//
//  Created by liangxl on 2017/10/24.
//  Copyright © 2017年 liangxl. All rights reserved.
//

#import "LoopTest.h"

@implementation LoopTest

+ (void)testArray{
    
    static const NSUInteger arrayItems = 10000000;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:arrayItems];
    for (int i = 0; i < arrayItems; i++) [array addObject:@(i)];
    array = [array copy];
    
    CFTimeInterval start = CFAbsoluteTimeGetCurrent();
    // Naive for loop
    for (NSUInteger i = 0; i < [array count]; i++)
    {
        id object = array[i];
        
    }
    CFTimeInterval forLoop = CFAbsoluteTimeGetCurrent();
    NSLog(@"For loop: %g", forLoop - start);
    
    
    
    // Optimized for loop
    NSUInteger count = [array count];
    for (NSUInteger i = 0; i <  count; i++)
    {
        id object = array[i];
        
    }
    CFTimeInterval forLoopWithCountVar = CFAbsoluteTimeGetCurrent();
    NSLog(@"Optimized for loop: %g", forLoopWithCountVar - forLoop);
    
    
    // NSEnumerator
    id obj = nil;
    NSEnumerator *enumerator = [array objectEnumerator];
    while ((obj = [enumerator nextObject]))
    {
        
    }
    CFTimeInterval enumeratorLoop = CFAbsoluteTimeGetCurrent();
    NSLog(@"Enumerator: %g", enumeratorLoop - forLoopWithCountVar);
    
    
    // Fast enumeration
    for (id object in array)
    {
        
    }
    CFTimeInterval forInLoop = CFAbsoluteTimeGetCurrent();
    NSLog(@"For…in loop: %g", forInLoop - enumeratorLoop);
    
    
    // Block enumeration
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {     }];
    CFTimeInterval enumerationBlock = CFAbsoluteTimeGetCurrent();
    NSLog(@"Enumeration block: %g", enumerationBlock - forInLoop);
    
    
    // Concurrent enumeration
    [array enumerateObjectsWithOptions:NSEnumerationConcurrent
                            usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {     }];
    
    CFTimeInterval concurrentEnumerationBlock = CFAbsoluteTimeGetCurrent();
    NSLog(@"Concurrent enumeration block: %g",
          concurrentEnumerationBlock - enumerationBlock);
    
    
    
    
}

+ (void)testDict{
    static const NSUInteger dictItems = 10000;
    NSMutableDictionary *dictionary =
    [NSMutableDictionary dictionaryWithCapacity:dictItems];    for (int i = 0; i < dictItems; i++) dictionary[@(i)] = @(i);
    dictionary = [dictionary copy];
    
    CFTimeInterval start = CFAbsoluteTimeGetCurrent();
    // Naive for loop
    for (NSUInteger i = 0; i < [dictionary count]; i++)
    {
        id key = [dictionary allKeys][i];
        id object = dictionary[key];
        
    }
    CFTimeInterval forLoop = CFAbsoluteTimeGetCurrent();
    NSLog(@"For loop: %g", forLoop - start);
    
    
    // Optimized for loop
    NSUInteger count = [dictionary count];
    NSArray *keys = [dictionary allKeys];
    for (NSUInteger i = 0; i <  count; i++)
    {
        id key = keys[i];
        id object = dictionary[key];
        
    }
    CFTimeInterval forLoopWithCountVar = CFAbsoluteTimeGetCurrent();
    NSLog(@"Optimized for loop: %g", forLoopWithCountVar - forLoop);
    
    
    // NSEnumerator
    id key = nil;
    NSEnumerator *enumerator = [dictionary keyEnumerator];
    while ((key = [enumerator nextObject]))
    {
        id object = dictionary[key];
        
    }
    CFTimeInterval enumeratorLoop = CFAbsoluteTimeGetCurrent();
    NSLog(@"Enumerator: %g", enumeratorLoop - forLoopWithCountVar);
    
    
    // Fast enumeration
    for (id key in dictionary)
    {
        id object = dictionary[key];
        
    }
    CFTimeInterval forInLoop = CFAbsoluteTimeGetCurrent();
    NSLog(@"For…in loop: %g", forInLoop - enumeratorLoop);
    
    
    // Block enumeration
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {     }];
    CFTimeInterval enumerationBlock = CFAbsoluteTimeGetCurrent();
    NSLog(@"Enumeration block: %g", enumerationBlock - forInLoop);
    
    
    // Concurrent enumeration
    [dictionary enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent
                                        usingBlock:^(id key, id obj, BOOL *stop) {     }];
    
    CFTimeInterval concurrentEnumerationBlock = CFAbsoluteTimeGetCurrent();
    NSLog(@"Concurrent enumeration block: %g",
          concurrentEnumerationBlock - enumerationBlock);
}


@end
