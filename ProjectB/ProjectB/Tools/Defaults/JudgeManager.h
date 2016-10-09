//
//  JudgeManager.h
//  ProjectB
//
//  Created by 芏小川 on 2016/10/8.
//  Copyright © 2016年 long. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JudgeManager : NSObject

+(instancetype)defaultManager;

@property (nonatomic,strong) UIColor *originColor;
@property (nonatomic,assign) BOOL isLogin;




@end
