//
//  LLNetWorkingRequest.m
//  OpenEyes
//
//  Created by long on 16/9/13.
//  Copyright © 2016年 long. All rights reserved.
//

#import "LLNetWorkingRequest.h"
#import "Reachability.h"
#import "LLShowHUD.h"


@interface LLNetWorkingRequest()

@end

@implementation LLNetWorkingRequest


+(void)reuqestWithType:(RequestType)type Controller:(UIViewController *)controller URLString:(NSString *)URLString Parameter:(NSDictionary *)ParaDic Success:(Success)success Fail:(Fail)fail{
    
    if (![self isConnectionNetWorking]) {
        [LLShowHUD showHUD:controller.view Message:@"您还没有连接到网路!" AfterDelay:0];
    }else{
        [LLShowHUD showHUD:controller.navigationController.view Message:@"正在努力加载数据..." AfterDelay:0.5];
        NSURLSession *session = [NSURLSession sharedSession];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]];
        if (type == POST) {
            request.HTTPMethod = @"POST";
            request.HTTPBody = [NSJSONSerialization dataWithJSONObject:ParaDic options:NSJSONWritingPrettyPrinted error:nil];
        }
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (data) {
                
                success(data);
            }else{
                [LLShowHUD showHUD:controller.navigationController.view Message:@"数据加载失败,请重试!" AfterDelay:0];
                fail(error);
            }
        }];
        [dataTask resume];
    }
}

+(BOOL)isConnectionNetWorking{
    BOOL isConntection = NO;
    Reachability *reacha = [Reachability reachabilityForInternetConnection];
    switch ([reacha currentReachabilityStatus]) {
        case NotReachable:{
            isConntection = NO;
            break;
        }
        case ReachableViaWiFi:{
            isConntection = YES;
            break;
        }
        case ReachableViaWWAN:{
            isConntection = YES;
            break;
        }
        default:
            break;
    }
    return isConntection;
}




@end
