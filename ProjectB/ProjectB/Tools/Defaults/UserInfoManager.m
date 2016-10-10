//
//  UserInfoManager.m
//  ProjectA
//
//  Created by 芏小川 on 16/9/20.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "UserInfoManager.h"

@implementation UserInfoManager




+(void)saveAuth:(NSString *)auth{
    [[NSUserDefaults standardUserDefaults] setObject:auth forKey:@"auth"];
    //同步 保证数据的完整性
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(void)saveUID:(NSString *)uid{
    [[NSUserDefaults standardUserDefaults] setObject:uid forKey:@"uid"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(void)saveUName:(NSString *)uname{
    [[NSUserDefaults standardUserDefaults] setObject:uname forKey:@"uname"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(void)saveCoverimg:(NSString *)coverimg{
    [[NSUserDefaults standardUserDefaults] setObject:coverimg forKey:@"coverimg"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(void)saveAuth:(NSString *)auth UID:(NSString *)uid UName:(NSString *)uname Coverimg:(NSString *)coverimg{
    [[NSUserDefaults standardUserDefaults] setObject:auth forKey:@"auth"];
    [[NSUserDefaults standardUserDefaults] setObject:uid forKey:@"uid"];
    [[NSUserDefaults standardUserDefaults] setObject:uname forKey:@"uname"];
    [[NSUserDefaults standardUserDefaults] setObject:coverimg forKey:@"coverimg"];
    
    
    //同步 保证数据的完整性
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *)getAuth{
    NSString *auth =  [[NSUserDefaults standardUserDefaults] objectForKey:@"auth"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return auth;
}

+(NSString *)getUname{
    NSString *uname = [[NSUserDefaults standardUserDefaults] objectForKey:@"uname"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return uname;
}






@end
