//
//  UIImageView+imageViewAnimation.m
//  ProjectB
//
//  Created by long on 2016/10/9.
//  Copyright © 2016年 long. All rights reserved.
//

#import "UIImageView+imageViewAnimation.h"

@implementation UIImageView (imageViewAnimation)


/** 背景图片放大动画 */
-(void)backgroundImageAnimation{
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.removedOnCompletion = NO;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.duration = 5;
    scaleAnimation.toValue = @(1.5);
    
    
    ///group
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.duration = 2;
    groupAnimation.repeatCount = 0;
    groupAnimation.animations = @[scaleAnimation];
    //按照原路返回
    groupAnimation.autoreverses = YES;
    
    [self.layer addAnimation:groupAnimation forKey:@"animation"];
}
/** 点赞动画 */
-(void)spotAnimation{
    
    CASpringAnimation *springAnimation = [CASpringAnimation animationWithKeyPath:@"transform.scale"];
    //质量
    springAnimation.mass = 1;
    //倍
    springAnimation.fromValue = @(0.5);
    springAnimation.toValue = @(1);
    springAnimation.repeatCount = 1;
    springAnimation.autoreverses = YES;
    //速度
    springAnimation.initialVelocity = 20;
    springAnimation.duration = springAnimation.settlingDuration;
    
    [self.layer addAnimation:springAnimation forKey:@"spring"];
    
}


@end
