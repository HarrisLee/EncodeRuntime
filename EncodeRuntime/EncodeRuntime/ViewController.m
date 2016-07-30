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
#import "UserCell.h"
#import "UIImageView+WebCache.h"
#import "TimeViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *table;
    NSMutableArray *info;
}
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
    

    
    NSArray *img = @[@"http://smart.suning.com/sh-web/api/sal/redirect?resourceId=5026bfc2-2f13-417d-80f0-b1e0e8709982",
                     @"http://smart.suning.com/sh-web/api/sal/redirect?resourceId=651f08c6-bd45-4276-9038-13b496166d06",
                     @"http://smart.suning.com/sh-web/api/sal/redirect?resourceId=7fa6fe4f-4d65-48fd-a4b9-82717dc6f68e",
                     @"http://smart.suning.com/sh-web/api/sal/redirect?resourceId=d1e55205-8fcf-4fd7-849d-6093a8ea351a",
                     @"http://smart.suning.com/sh-web/api/sal/redirect?resourceId=302bd5fb-7cf9-45c3-b78c-f4bd565774cb"];
    
    info = [[NSMutableArray alloc] init];
    for (int i = 0; i < 200; i++) {
        StudentSubClass *student = [[StudentSubClass alloc] init];
        student.name = [NSString stringWithFormat:@"学生%d",i];
        student.school = [NSString stringWithFormat:@"大学%d",i];
        student.sub = [NSString stringWithFormat:@"sub%d",i];
        student.portrait = [img objectAtIndex:i%5];
        [info addObject:student];
    }
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStylePlain];
    [table registerClass:[UserCell class] forCellReuseIdentifier:@"info"];
    table.delegate = self;
    table.dataSource = self;
    table.showsVerticalScrollIndicator = NO;
    [self.view addSubview:table];
    
    
//    [NSRunLoop currentRunLoop] addTimer:<#(nonnull NSTimer *)#> forMode:NSRunLoopCommonModes
//    
//    FBSSerialQueue
    
}

- (void)startActivity
{
    NSLog(@"start");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"info" forIndexPath:indexPath];
    StudentSubClass *model = [info objectAtIndex:indexPath.row];
    cell.nameLabel.text = model.name;
    cell.schoolLabel.text = model.school;
    cell.subLabel.text = model.sub;
    [cell.iconView sd_setImageWithURL:[NSURL URLWithString:model.portrait]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TimeViewController *vc = [[TimeViewController alloc] init];
    vc.title = @"时间Time测试";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
