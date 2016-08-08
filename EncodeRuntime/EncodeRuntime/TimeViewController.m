
//
//  TimeViewController.m
//  EncodeRuntime
//
//  Created by JianRongCao on 7/30/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "TimeViewController.h"
#import "RMWeakTimerTarget.h"
#import "Person.h"


@interface TimeViewController ()
{
//    RMWeakTimerTarget *time;
    NSTimer *time;
}
@property (nonatomic,weak) Person *person;
@end

@implementation TimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //此方法可以实现Timer在ViewController被Pop的时候 执行dealloc方法。
//    time = [RMWeakTimerTarget
//            scheduledTimerWithTimeInterval:1.0
//            target:self selector:@selector(showName:)
//            userInfo:@"infos Object"
//            repeats:YES dispatchQueue:dispatch_get_main_queue()];
    
    Person *person = [Person new];
    self.person = person;
    
    
//    //此time在Dealloc里面释放的话会无法实现。因为Timer添加到Runloop的时候，会被Runloop强引用，
    //timer对target又做了强引用，导致 target 一直不能被释放掉，所以也就走不到target的dealloc里
    //当Person 没有showDesciption:方法时，会奔溃（只要有这个方法，而不管有没有在头文件。h中定义）
    time = [NSTimer scheduledTimerWithTimeInterval:10.0
                                            target:self.person
                                          selector:@selector(showDesciption:)
                                          userInfo:@"info"
                                           repeats:YES];
    
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    table.backgroundColor = [UIColor redColor];
    [self.view addSubview:table];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [time fire];
}

- (void)showName:(id)obj
{
    NSLog(@"name %@",obj);
}

- (void)dealloc
{
    [time invalidate];

//    if ([self.time isValid]) {
//        [self.time invalidate];
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
