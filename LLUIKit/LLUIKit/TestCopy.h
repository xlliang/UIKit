//
//  TestCopy.h
//  LLUIKit
//
//  Created by 梁先生 on 2018/7/18.
//  Copyright © 2018 liangxl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


//1.让类实现NSCopying/NSMutableCopying协议。
//2.让类实现copyWithZone:/mutableCopyWithZone:方法



/* 注意点
 同时需要注意的是如果对象中有其他指针类型的实例变量，且只是简单的赋值操作:person.obj2 = self.obj2，其中obj2是另一个自定义类，如果我们修改obj2中的属性，我们会发现复制后的person对象中obj2对象中的属性值也变了，因为对于这个对象并没有进行copy操作，这样的复制操作不是完全的复制，如果要实现完全的复制，需要将obj2对应的类也要实现copy,然后这样赋值:person.obj2 = [self.obj2 copy]。如果对象很多或者层级很多，实现起来还是很麻烦的。如果需要实现完全复制同样还有另有一种方法，那就是归档:
 TestCopy *copy = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:person1]];
 
 这样我们就实现了自定义对象的复制，需要指出的是如果重写copyWithZone:方法时，其父类已经实现NSCopying协议，并重写过了copyWithZone:方法，那么子类重写copyWithZone:方法应先调用父类的copy方法复制从父类继承得到的成员变量，然后对子类中定义的成员变量进行赋值:
 
 - (id)copyWithZone:(NSZone *)zone {
 
 id obj = [super copy];
 //对子类定义的成员变量赋值
 ...
 return obj;
 
 }
 */

//关于mutableCopy的实现与copy的实现类似

@interface TestCopy : NSObject<NSCopying>

@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSString *name;


/*crash提示不允许修改mutableString属性，这是因为程序定义mutableString属性时使用了copy指示符，该指示符置顶调用setMutableString:方法时(通过点语法赋值时，实际上是调用对应的setter方法)，程序实际上会使用参数的副本对mutableString实际变量复制。也就是说，setMutableString:方法的代码如下:
- (void)setMutableString:(NSMutableString *)mutableString {
    
    _mutableString = [mutableString copy];
    
}*/
//@property (nonatomic, copy) NSMutableString *mutableString;

//如果对象中又有其他的自定义对象属性,那么这个对象也需要实现它的copyWithZone:方法.方式如TestCopy
//@property (nonatomic, strong) Dog *dog;

@end


@interface Person : TestCopy


@property (nonatomic, strong) NSString *sex;

@end

NS_ASSUME_NONNULL_END
