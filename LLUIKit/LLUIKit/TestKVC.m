//
//  TestKVC.m
//  LLUIKit
//
//  Created by 梁先生 on 2018/7/26.
//  Copyright © 2018 liangxl. All rights reserved.
//

#import "TestKVC.h"

@implementation Book
@end

@implementation TestKVC

- (void)testStart{
    
    //    通过arc4random() 获取0到x-1之间的整数的代码如下：
    //    int value = arc4random() % x;
    //    获取1到x之间的整数的代码如下
    //    int value = (arc4random() % x) + 1;
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i=0; i<5; i++) {
        Book *book = [[Book alloc] init];
        book.price = (arc4random() % 100) + 1;
        NSLog(@"%f",book.price);
        book.name = [NSString stringWithFormat:@"name_%d",i];
        [array addObject:book];
    }
    
    //    NSLog(@"array:%@",array);
    
    
    /*
     * 测试集合操作 简单集合运算符共有@avg， @count ， @max ， @min ，@sum5种
     */
    NSNumber* sum = [array valueForKeyPath:@"@sum.price"];
    NSLog(@"sum:%f",sum.floatValue);
    NSNumber* avg = [array valueForKeyPath:@"@avg.price"];
    NSLog(@"avg:%f",avg.floatValue);
    NSNumber* count = [array valueForKeyPath:@"@count"];
    NSLog(@"count:%f",count.floatValue);
    NSNumber* min = [array valueForKeyPath:@"@min.price"];
    NSLog(@"min:%f",min.floatValue);
    NSNumber* max = [array valueForKeyPath:@"@max.price"];
    NSLog(@"max:%f",max.floatValue);
    
    NSLog(@"==================NSNumner========================");
    NSArray *numberArray = @[@1,@2,@3];
    NSNumber* sum1 = [numberArray valueForKeyPath:@"@sum.self"];
    NSLog(@"sum:%f",sum1.floatValue);
    NSNumber* avg1 = [numberArray valueForKeyPath:@"@avg.self"];
    NSLog(@"avg:%f",avg1.floatValue);
    NSNumber* count1 = [numberArray valueForKeyPath:@"@count.self"];
    NSLog(@"count:%f",count1.floatValue);
    NSNumber* min1 = [numberArray valueForKeyPath:@"@min.self"];
    NSLog(@"min:%f",min1.floatValue);
    NSNumber* max1 = [numberArray valueForKeyPath:@"@max.self"];
    NSLog(@"max:%f",max1.floatValue);
    
    
    NSLog(@"===========================================");
    NSLog(@"===========================================");
    
    /*
     * 测试对象运算符 集合运算符稍微复杂，能以数组的方式返回指定的内容，一共有两种：
     * @distinctUnionOfObjects  返回去重以后的结果
     * @unionOfObjects 返回的元素是全集
     */
    
    NSArray* arrDistinct = [array valueForKeyPath:@"@distinctUnionOfObjects.price"];
    for (NSNumber *price in arrDistinct) {
        NSLog(@"%f",price.floatValue);
    }
    NSLog(@"===========================================");
    NSArray* arrUnion = [array valueForKeyPath:@"@unionOfObjects.price"];
    for (NSNumber *price in arrUnion) {
        NSLog(@"%f",price.floatValue);
    }
    
    //Array和Set操作符：
    NSLog(@"===================Array和Set操作符========================");
    {
        
//    @unionOfArrays:返回操作对象（且操作对象内对象必须是数组/集合）中数组/集合的所有对象，返回值为数组
//    @distinctUnionOfArrays:返回操作对象（且操作对象内对象必须是数组/集合）中数组/集合的不同对象，返回值为数组
//    @distinctUnionOfSets:返回操作对象（且操作对象内对象必须是数组/集合）中数组/集合的所有对象，返回值为集合
        
        Book *b1 = [Book new];
        b1.name = @"iphon1";
        b1.price = 100;
        
        Book *b2 = [Book new];
        b2.name = @"iphon2";
        b2.price = 102;
        
        Book *b3 = [Book new];
        b3.name = @"iphon2";
        b3.price = 103;
        
        Book *b4 = [Book new];
        b4.name = @"iphon4";
        b4.price = 104;
        
        Book *b6 = [Book new];
        b6.name = @"iphon6";
        b6.price = 106;
        
        Book *b5 = [Book new];
        b5.name = @"iphon5";
        b5.price = 105;
        
        NSSet *set1 = [NSSet setWithObjects:b1 ,b2, nil];
        NSSet *set2 = [NSSet setWithObjects:b3 ,b4, nil];
        NSSet *set3 = [NSSet setWithObjects:b5 ,b6, nil];
        NSSet *set = [NSSet setWithObjects:set1 ,set2,set3, nil];
        
        NSArray *arr1 = @[b1,b2];
        NSArray *arr2 = @[b3,b4];
        NSArray *arr3 = @[b5,b6];
        NSArray *arr = @[arr1,arr2,arr3];
       
        NSLog(@"unionOfArrays:%@",[arr valueForKeyPath:@"@unionOfArrays.name"]);
        NSLog(@"distinctUnionOfArrays:%@",[arr valueForKeyPath:@"@distinctUnionOfArrays.name"]);
        NSLog(@"udistinctUnionOfSets:%@",[set valueForKeyPath:@"@distinctUnionOfSets.name"]);
        
    }
    
    //KVC的消息传递
    NSLog(@"===========================================");
    {
        NSArray *array = [NSArray arrayWithObjects:@"10.11",@"20.22", nil];
        NSArray *resultArray = [array valueForKeyPath:@"doubleValue"];
        NSLog(@"%@", resultArray);
        
        NSArray *arr = @[@"john", @"tom", @"lucy", @"lily"];
        NSArray *captainArr = [arr valueForKey:@"capitalizedString"];
        NSLog(@"captainArr = %@", captainArr);
        
    }
    
    NSLog(@"==============custom 集合 kvc =============================");
    {
        NSArray *cus = @[@1,@2,@3];
        NSLog(@"customKvc:%@",[cus valueForKeyPath:@"@java.self"]);
//        NSLog(@"customKvc:%@",[cus valueForKey:@"@swfit.self"]);  //crash

    }
    
    
}

@end
