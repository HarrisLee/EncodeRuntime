//
//  StudentSubClass.m
//  EncodeRuntime
//
//  Created by JianRongCao on 4/11/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "StudentSubClass.h"
#import <objc/runtime.h>

@implementation StudentSubClass
@dynamic userN;

- (instancetype)copyWithZone:(NSZone *)zone
{
    id model = [[[self class] allocWithZone:zone] init];
    id peopleClass = [self class];
    do {
        unsigned int outCount;
        objc_property_t *properties = class_copyPropertyList(peopleClass, &outCount);
        for (int idx = 0; idx < outCount; idx++) {
            objc_property_t property = properties[idx];
            NSString *propName = [NSString stringWithUTF8String:property_getName(property)];
            id value = [self valueForKey:propName];
            [model setValue:value forKey:propName];
            fprintf(stdout, "%s %s\n", property_getName(property), property_getAttributes(property));
        }
    
        peopleClass = [peopleClass superclass];
        
    } while (![[peopleClass description] isEqualToString:@"NSObject"]);
    return model;
}

- (void)setSub:(NSString *)ssub
{
    NSLog(@"setSub:%@",ssub);
}

- (void)showName
{
    
}

/**
 *  当该类没有sel方法IMPL实现的时候，会调用到此方法。
 *  这个函数是给类利用class_addMethod添加函数的机会
 *
 *  @param sel 执行的方法
 *
 *  @return 是否有IMPL指针
 */
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    NSString *selectorString = NSStringFromSelector(sel);
    if ([selectorString hasPrefix:@"set"]) {
        class_addMethod(self, sel, method_getImplementation(class_getInstanceMethod(self, @selector(SSSSset:))), "v@:@");
    }
    else {
        class_addMethod(self, sel, method_getImplementation(class_getInstanceMethod(self, @selector(SSSSget))), "@@:");
    }
   
    return YES;
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    return [super respondsToSelector:aSelector];
}

- (void)SSSSset:(id)value
{
    NSLog(@"setSSSSS");
}

- (id)SSSSget
{
    NSLog(@"get");
    return @"get1";
}

@end
