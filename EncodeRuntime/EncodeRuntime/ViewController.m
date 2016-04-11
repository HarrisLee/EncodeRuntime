//
//  ViewController.m
//  EncodeRuntime
//
//  Created by JianRongCao on 4/11/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Student.h"
#import "StudentSubClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *person = [[Person alloc] init];
    person.name = @"庄子";
    person.sex = @"男";
    person.education = @"本科";
    person.native = @"江苏";
    person.job = @"iOS开发";
    person.age = 27;
    person.height = 180;
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *path = [docPath stringByAppendingPathComponent:@"person"];
    NSLog(@"path=%@",path);
    [NSKeyedArchiver archiveRootObject:person toFile:path];
    
    
    Person *nPerson = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    person.native = @"江苏省";
    nPerson = [person copy];
    NSLog(@"%@",nPerson);
    
    Student *s1 = [[Student alloc] init];
    s1.name = @"学生1";
    s1.school = @"NY";
    Student *s2 = [s1 copy];
    NSLog(@"%@",s2);
    
    StudentSubClass *ss1 = [[StudentSubClass alloc] init];
    ss1.name = @"ss1";
    ss1.school = @"YZ";
    ss1.sub = @"sssSub";
    StudentSubClass *ss2 = [ss1 copy];
    NSLog(@"%@",ss2);
    
    [person getIvarList];
    [person getProtoclList];
    [person getPropertyName];
    [person getMethodList];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
