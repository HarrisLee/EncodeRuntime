//
//  Person.h
//  EncodeRuntime
//
//  Created by JianRongCao on 4/11/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic,strong) NSString *_Nullable portrait;

@property (nonatomic,strong) NSString *_Nullable name;

@property (nonatomic,strong) NSString *_Nullable job;

@property (nonatomic,strong) NSString *_Nullable native;

@property (nonatomic,strong) NSString *_Nullable education;

@property (nonatomic,assign) NSInteger age;

@property (nonatomic,assign) NSInteger height;

@property (nonatomic,strong) NSString *_Nullable sex;

- (void)setValue:(_Nullable id)value forUndefinedKey:( NSString * _Nullable )key;

- (nullable id)valueForUndefinedKey:(NSString * _Nullable)key;

- (void)getIvarList;

- (void)getPropertyName;

- (void)getMethodList;

- (void)getProtoclList;

- (void)showDesciption:(_Nullable id)obj;
@end
