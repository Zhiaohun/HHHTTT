//
//  UIView+ShadowView.m
//  ProjectB
//
//  Created by long on 2016/10/10.
//  Copyright © 2016年 long. All rights reserved.
//

#import "UIView+ShadowView.h"

@implementation UIView (ShadowView)

+(void)shadowView:(UIView *)view{
    
    //给cell加上一层阴影,实现浮动效果
    view.backgroundColor = [UIColor whiteColor];
    //给cellView边框设置阴影
    view.layer.shadowOffset = CGSizeMake(1,1);
    view.layer.shadowOpacity = 0.3;
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    
}

@end
