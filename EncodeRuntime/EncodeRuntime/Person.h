//
//  Person.h
//  EncodeRuntime
//
//  Created by JianRongCao on 4/11/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic,strong) NSString *portrait;

@property (nonatomic,strong) NSString *name;

@property (nonatomic,strong) NSString *job;

@property (nonatomic,strong) NSString *native;

@property (nonatomic,strong) NSString *education;

@property (nonatomic,assign) NSInteger age;

@property (nonatomic,assign) NSInteger height;

@property (nonatomic,strong) NSString *sex;

- (void)setValue:(id)value forUndefinedKey:(NSString *)key;

- (nullable id)valueForUndefinedKey:(NSString *)key;

- (void)getIvarList;

- (void)getPropertyName;

- (void)getMethodList;

- (void)getProtoclList;

//- (void)showDesciption:(_Nullable id)obj;

@end
