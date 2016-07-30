
//
//  TimeViewController.m
//  EncodeRuntime
//
//  Created by JianRongCao on 7/30/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "TimeViewController.h"

@interface TimeViewController ()
{
    NSTimer *time;
}
//@property (nonatomic,strong) NSTimer *time;

@end

@implementation TimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof(self) weakSelf = self;
    time = [NSTimer scheduledTimerWithTimeInterval:1.0 target:weakSelf selector:@selector(showName:) userInfo:@"info" repeats:YES];
}

- (void)showName:(id)obj
{
    NSLog(@"name %@",obj);
}

- (void)dealloc
{
    if ([time isValid]) {
        [time invalidate];
    }
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
