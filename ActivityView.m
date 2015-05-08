//
//  ActivityView.m
//  Tickets4Me
//
//  Created by Богомолов Евгений on 07.05.15.
//  Copyright (c) 2015 Bogomolov Evgeniy. All rights reserved.
//

#import "ActivityView.h"

@implementation ActivityView {
    
}

+ (ActivityView *)instance {
    static ActivityView *instance = nil;
    static dispatch_once_t predicate = 0;
    
    dispatch_once(&predicate, ^{ instance = [self new]; });
    
    return instance;
}

- (instancetype)init {
    NSLog(@"INIT ACTIVITY VIEW");
    self = [super initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-100)/2, ([UIScreen mainScreen].bounds.size.height - 100)/2.3, 100, 100)];
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    
    self.backgroundColor = [UIColor colorWithWhite:.2 alpha:.6];
    UIActivityIndicatorView *indicator = [UIActivityIndicatorView new];
    [indicator startAnimating];
    indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    indicator.color = [UIColor colorWithRed:2 green:8 blue:2 alpha:7];
    
    indicator.frame = CGRectMake((100-indicator.bounds.size.width)/2, (100-indicator.bounds.size.height)/2, indicator.bounds.size.width, indicator.bounds.size.height);
    [self addSubview:indicator];
    
    return self;
}

#pragma mark - Base 
+ (void)startAnimation {
    [self startAnimationUserInteractionEnabled:YES];
}
+ (void)startAnimationUserInteractionEnabled:(BOOL)enabled {
    [self instance].alpha = 1.f;
    
    UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
    [keyWindow.viewForBaselineLayout addSubview:[self instance]];
    keyWindow.userInteractionEnabled = enabled;
}
+ (void)stopAnimation {
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{

        [self instance].alpha = 0.f;
    } completion:^(BOOL finished) {
        
        [[self instance] removeFromSuperview];
    }];
    
    UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
    keyWindow.userInteractionEnabled = YES;
}

@end
