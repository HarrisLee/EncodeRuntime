//
//  Person.m
//  EncodeRuntime
//
//  Created by JianRongCao on 4/11/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@interface Person ()<NSCoding,NSCopying>
{
    NSString *ivarName1;
    NSString *ivarName2;
    NSString *ivarName3;
}
@end

@implementation Person

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (int idx = 0; idx < count; idx++) {
        objc_property_t property = properties[idx];
        //获取C字符串属性名称
        const char *name = property_getName(property);
        //C字符串属性名称转OC NSString名称
        NSString *propertyName = [[NSString alloc] initWithUTF8String:name];
        //对该属性进行解码
        NSString *propertyValue = [aDecoder decodeObjectForKey:propertyName];
        [self setValue:propertyValue forKey:propertyName];
    }
    
    free(properties);
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count;
    //获取指向当前类的所有属性
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (int idx = 0; idx < count; idx++) {
        objc_property_t property = properties[idx];
        //获取C字符串属性名称
        const char *name = property_getName(property);
        //C字符串属性名称转OC NSString名称
        NSString *propertyName = [[NSString alloc] initWithUTF8String:name];
        //获取属性值名称
        NSString *propertyValue = [self valueForKey:propertyName];
        //对该属性进行编码
        [aCoder encodeObject:propertyValue forKey:propertyName];
    }
    
    free(properties);
}

- (instancetype)copyWithZone:(NSZone *)zone
{
    id model = [[[self class] allocWithZone:zone] init];
    id peopleClass = [self class];
    do {
        unsigned int outCount;
        //获取指向当前类的所有属性
        objc_property_t *properties = class_copyPropertyList(peopleClass, &outCount);
        for (int idx = 0; idx < outCount; idx++) {
            objc_property_t property = properties[idx];
            //获取当前属性的NSString名称
            NSString *propName = [NSString stringWithUTF8String:property_getName(property)];
            //获取该属性的值
            id value = [self valueForKey:propName];
            //将该属性的值复制到Model
            [model setValue:value forKey:propName];
            fprintf(stdout, "%s %s\n", property_getName(property), property_getAttributes(property));
        }
        
        peopleClass = [peopleClass superclass];
        
    } while (![[peopleClass description] isEqualToString:@"NSObject"]);
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"未定义的属性%@：%@\n",key,value);
}

- (nullable id)valueForUndefinedKey:(NSString *)key
{
    NSLog(@"未定义的属性%@\n",key);
    return nil;
}

- (void)getIvarList
{
    unsigned int count;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int idx = 0; idx < count; idx++) {
        Ivar ivar = ivars[idx];
        const char *name = ivar_getName(ivar);
        NSString *ivarName = [[NSString alloc] initWithUTF8String:name];
        NSLog(@"%@:%@\n",ivarName,[self valueForKey:ivarName]);
    }
    free(ivars);
}

- (void)getPropertyName
{
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (int idx = 0; idx < count; idx++) {
        objc_property_t property = properties[idx];
        const char *name = property_getName(property);
        NSString *propertyName = [[NSString alloc] initWithUTF8String:name];
        NSLog(@"%@:%@\n",propertyName,[self valueForKey:propertyName]);
    }
    free(properties);
}

- (void)getProtoclList
{
    unsigned int count;
    __unsafe_unretained Protocol **protocols = class_copyProtocolList([self class], &count);
    for (int idx = 0; idx < count; idx++) {
        Protocol *protocol = protocols[idx];
        const char *name = protocol_getName(protocol);
        NSString *protocolName = [[NSString alloc] initWithUTF8String:name];
        NSLog(@"%@\n",protocolName);
    }
}

- (void)getMethodList
{
    unsigned int count;
    Method *methods = class_copyMethodList([self class], &count);
    for (int idx = 0; idx < count; idx++) {
        Method method = methods[idx];
        SEL selName = method_getName(method);
        const char *name = sel_getName(selName);
        NSString *methodName = [[NSString alloc] initWithUTF8String:name];
        
        int args = method_getNumberOfArguments(method);
        
        NSLog(@"%@, args count:%d\n",methodName,args);
    }
}

@end
