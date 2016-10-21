//
//  JudgeManager.m
//  ProjectB
//
//  Created by 芏小川 on 2016/10/8.
//  Copyright © 2016年 long. All rights reserved.
//

#import "JudgeManager.h"

@implementation JudgeManager

+(instancetype)defaultManager{
    static JudgeManager *judgeManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        judgeManager = [[JudgeManager alloc]init];
    });
    return judgeManager;
}

-(UILabel *)setFont:(NSString *)str{
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,100,30)];
    label.text = str;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"迷你简行楷" size:24.0];
    return label;
}
@end
