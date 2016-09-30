//
//  LLNetWorkingRequest.h
//  OpenEyes
//
//  Created by long on 16/9/13.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLNetWorkingRequest : UIView

typedef NS_ENUM(NSInteger, RequestType) {
    GET,
    POST
};

typedef void(^Success)(NSData *data);
typedef void(^Fail)(NSError *error);

+(void)reuqestWithType:(RequestType)type Controller:(UIViewController *)controller URLString:(NSString *)URLString Parameter:(NSDictionary *)ParaDic Success:(Success)success Fail:(Fail)fail;

@end
