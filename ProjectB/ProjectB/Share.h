//
//  Share.h
//  ProjectB
//
//  Created by long on 2016/10/13.
//  Copyright © 2016年 long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
@interface Share : NSObject

+(void)shareToWeiBo:(NSArray *)imageArray Content:(NSString *)content URLStr:(NSString *)str Title:(NSString *)title;

@end
