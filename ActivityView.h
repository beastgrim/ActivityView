//
//  ActivityView.h
//  Tickets4Me
//
//  Created by Богомолов Евгений on 07.05.15.
//  Copyright (c) 2015 Bogomolov Evgeniy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityView : UIView

+ (void)startAnimation;
+ (void)startAnimationUserInteractionEnabled:(BOOL)enabled;

+ (void)stopAnimation;

@end
