//
//  StudentSubClass.h
//  EncodeRuntime
//
//  Created by JianRongCao on 4/11/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "Student.h"

@interface StudentSubClass : Student<NSCopying>

@property (nonatomic,strong) NSString *sub;

@property (nonatomic,strong) NSString *userN;

- (void)showName;

@end
