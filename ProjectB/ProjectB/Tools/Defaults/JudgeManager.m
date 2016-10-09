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


@end
