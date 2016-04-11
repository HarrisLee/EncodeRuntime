//
//  Student.h
//  EncodeRuntime
//
//  Created by JianRongCao on 4/11/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "Person.h"

@interface Student : Person<NSCopying>

@property (nonatomic,strong) NSString *school;

@end
