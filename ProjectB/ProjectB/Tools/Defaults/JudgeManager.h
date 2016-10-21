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

@property (nonatomic,strong) NSString *currentID;
@property (nonatomic,strong) NSString *currentAbsract;
@property (nonatomic,strong) NSString *content;

@property (nonatomic,strong) NSString *MainBGImg;
@property (nonatomic,strong) NSString *LeftBGImg;

@end
