//
//  RMWeakerTime.m
//  EncodeRuntime
//
//  Created by JianRongCao on 8/11/16.
//  Copyright © 2016 JianRongCao. All rights reserved.
//

#import "RMWeakerTime.h"

@implementation RMWeakerTime

- (void)fire:(NSTimer *)timer {
    if(self.target) {
        IMP imp = [self.target methodForSelector:self.selector];
        void (*func)(id, SEL) = (void *)imp;
        func(self.target, self.selector);
    } else {
        [self.timer invalidate];
    }
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                     target:(id)aTarget
                                   selector:(SEL)aSelector
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)repeats
{
    RMWeakerTime *timerTarget = [[RMWeakerTime alloc] init];
    timerTarget.target = aTarget;
    timerTarget.selector = aSelector;
    timerTarget.timer = [NSTimer scheduledTimerWithTimeInterval:interval
                                                         target:timerTarget
                                                       selector:@selector(fire:)
                                                       userInfo:userInfo
                                                        repeats:repeats];
    [[NSRunLoop mainRunLoop] addTimer:timerTarget.timer forMode:NSRunLoopCommonModes];
    return timerTarget.timer;
}

- (void)dealloc
{
    NSLog(@"sub dealloc");
}

@end
