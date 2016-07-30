
//
//  TimeViewController.m
//  EncodeRuntime
//
//  Created by JianRongCao on 7/30/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "TimeViewController.h"
#import "RMWeakTimerTarget.h"

@interface TimeViewController ()
{
    RMWeakTimerTarget *time;
//    NSTimer *time;
}

@end

@implementation TimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //此方法可以实现Timer在ViewController被Pop的时候 执行dealloc方法。
    time = [RMWeakTimerTarget
            scheduledTimerWithTimeInterval:1.0
            target:self selector:@selector(showName:)
            userInfo:@"infos Object"
            repeats:YES dispatchQueue:dispatch_get_main_queue()];
    
    
//    //此time在Dealloc里面释放的话会无法实现。因为Timer添加到Runloop的时候，会被Runloop强引用，
//    //timer对target又做了强引用，导致 target 一直不能被释放掉，所以也就走不到target的dealloc里
//    time = [NSTimer scheduledTimerWithTimeInterval:1.0
//                                            target:self
//                                          selector:@selector(showName:)
//                                          userInfo:@"info"
//                                           repeats:YES];
    
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
