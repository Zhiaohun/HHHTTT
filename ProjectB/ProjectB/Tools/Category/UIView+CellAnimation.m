//
//  UIView+CellAnimation.m
//  ProjectB
//
//  Created by long on 2016/10/12.
//  Copyright © 2016年 long. All rights reserved.
//

#import "UIView+CellAnimation.h"

@implementation UIView (CellAnimation)

+(void)cellAnimationOne:(UIView *)view{
    //1. Setup the CATransform3D structure
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;
    
    
    //2. Define the initial state (Before the animation)
    view.layer.shadowColor = [[UIColor blackColor]CGColor];
    view.layer.shadowOffset = CGSizeMake(10, 10);
    view.alpha = 0;
    
    view.layer.transform = rotation;
    view.layer.anchorPoint = CGPointMake(0, 0.5);
    
    
    //3. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.8];
    view.layer.transform = CATransform3DIdentity;
    view.alpha = 1;
    view.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
}

+(void)cellAnimationTwo:(UIView *)view{
    //设置Cell的动画效果为3D效果
    //设置x和y的初始值为0.1；
     view.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    //x和y的最终值为1
      [UIView animateWithDuration:1 animations:^{
          view.layer.transform = CATransform3DMakeScale(1, 1, 1);
      }];
}



@end
