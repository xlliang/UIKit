//
//  StringTest.m
//  LLUIKit
//
//  Created by 梁先生 on 2018/8/23.
//  Copyright © 2018 liangxl. All rights reserved.
//

#import "StringTest.h"

@implementation StringTest

-(void)test{
    //该代码是在MRC环境下测试用
    
    NSString *str1 = @"123456789";//用@""方法创建一个  固定长度为9的字符串
    NSString *str2 = @"1234567890";//用@""方法创建一个  固定长度为10的字符串
    
    
    NSString *str3 = [NSString stringWithFormat:@"234567890"];//用stringWithFormat方法创建一个  固定长度为9的字符串
    NSString *str4 = [NSString stringWithFormat:@"2345678901"];//用stringWithFormat方法创建一个  固定长度为10的字符串
    
    NSString *str5 = [[NSString alloc] initWithString:@"345678901"];//用initWithString方法创建一个  固定长度为9的字符串
    NSString *str6 = [[NSString alloc] initWithString:@"3456789012"];//用initWithString方法创建一个  固定长度为9的字符串
    
    NSString *str7 = [[NSString alloc] initWithFormat:@"456789012"];//用initWithFormat方法创建一个  固定长度为9的字符串
    NSString *str8 = [[NSString alloc] initWithFormat:@"4567890123"];//用initWithFormat方法创建一个  固定长度为9的字符串
    
    NSString *str9 = [NSString stringWithFormat:@"1234567890"];//用stringWithFormat方法创建一个  固定长度为10的字符串并与str2字符串一样的字符串
    NSString *str10 = [[NSString alloc] initWithString:@"1234567890"];//用initWithString方法创建一个  固定长度为10的字符串并与str2字符串一样的字符串
    
    NSLog(@"str1 用@"" 的retainCount为:%ld \n  对象内地地址:%p",[str1 retainCount],str1);
    NSLog(@"str2 用@"" 的retainCount为:%ld \n  对象内地地址:%p",[str2 retainCount],str2);
    NSLog(@"-----------------------------------------------------------------");
    NSLog(@"str3 用stringWithFormat 的retainCount为:%ld \n  对象内地地址:%p",[str3 retainCount],str3);
    NSLog(@"str4 用stringWithFormat 的retainCount为:%ld \n  对象内地地址:%p",[str4 retainCount],str4);
    NSLog(@"-----------------------------------------------------------------");
    NSLog(@"str5 用initWithString 的retainCount为:%ld \n  对象内地地址:%p",[str5 retainCount],str5);
    NSLog(@"str6 用initWithString 的retainCount为:%ld \n  对象内地地址:%p",[str6 retainCount],str6);
    NSLog(@"-----------------------------------------------------------------");
    NSLog(@"str7 用initWithFormat 的retainCount为:%ld \n  对象内地地址:%p",[str7 retainCount],str7);
    NSLog(@"str8 用initWithFormat 的retainCount为:%ld \n  对象内地地址:%p",[str8 retainCount],str8);
    NSLog(@"-----------------------------------------------------------------");
    NSLog(@"使用lu看一下 str1 的retainCount为:%lu \n  对象内地地址:%p",[str1 retainCount],str1);
    NSLog(@"使用lu看一下 str4 的retainCount为:%lu \n  对象内地地址:%p",[str4 retainCount],str4);
    NSLog(@"-----------------------------------------------------------------");
    NSLog(@"str9  字符串与str2一样 的retainCount为:%lu \n  对象内地地址:%p",[str9 retainCount],str9);
    NSLog(@"str10  字符串与str2一样 的retainCount为:%lu \n  对象内地地址:%p",[str10 retainCount],str10);
    
    
    
    
    /*
     
     五大内存区域
     
     栈区，堆区，全局区，常量区，代码区
     
     五大内存区域之外还有 自由存储区也称之五大区域之外区
     
     
     
     
     
     
     
     1.为什么用 @"",  stringWithFormat, initWithString, initWithFormat四种方式。
     
     因为方式不同，创建的对象所存在内存区域不同。你会发现str2 与 str9 字符串内容一样。为什么对象地址一个是0x1053674f8 另一个是0x604000033580。正常情况下，字符串内容一样，应该取的是同一个内存地址。就像str2与str10一样。虽然创建的方法不一样，但是字符串一样，内存地址就是一样的。 这就是区别。 @“”与initWithString方法创建的字符串于stringWithFormat、initWithFormat创建的字符串所在的内存区域不同。
     
     2.为什么要区分长度9 和 长度10的字符串？
     
     因为字符串长度不一样，字符串所在内存区域不同，retainCount也不同。从上面结果中可以看出，str3和str4是同一种方式创建的字符串，但一个内存是0xa287dcaecc2ac5d9一个是0x6040000339a0。因为前者是在五大区域之外的内存区，而后者在堆中。
     
     由上面连2点结合可知，由initWithString和stringWithString创建的NSString对象，不管字符串的内容和长度怎么变化，该字符串对象始终是存储在常量区的，引用计数为-1；从用%lu打印来看initWithString和stringWithString创建的字符串retainCount是无符号长整型的最大值。所以可以说他们没有引用计数这个概念
     
     而由initWithFormat和stringWithFormat创建的对象，如果字符串内容是非汉字的，那么当字符串长度小于10个时，该字符串存储区域在五大区域之外，且随着字符串长度的变化，存储地址会有很大变化。当字符串长度超过10个以后，该字符串在堆中，与正常的OC对象一样。这里为什么要说非汉字呢，因为如果字符串内容是汉字，不管字符串的内容和长度怎么变化，该字符串都是在堆中，与正常OC对象一样。
     */
}

@end
