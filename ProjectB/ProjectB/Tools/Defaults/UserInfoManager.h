//
//  UserInfoManager.h
//  ProjectA
//
//  Created by 芏小川 on 16/9/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoManager : NSObject
//存
+(void)saveAuth:(NSString *)auth;
+(void)saveUID:(NSString *)uid;
+(void)saveUName:(NSString *)uname;
+(void)saveCoverimg:(NSString *)coverimg;

+(void)saveAuth:(NSString *)auth UID:(NSString *)uid UName:(NSString *)uname Coverimg:(NSString *)coverimg;
//取
+(NSString *)getAuth;
+(NSString *)getUname;


@end
