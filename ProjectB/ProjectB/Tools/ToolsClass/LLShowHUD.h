//
//  LLShowHUD.h
//  ProjectB
//
//  Created by long on 2016/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^NetWorkRequestBlock)();
@interface LLShowHUD : NSObject

@property (nonatomic, copy) NetWorkRequestBlock requestBlock;
/** 纯文字提示 */
+(void)showHUD:(UIView *)view Message:(NSString *)str AfterDelay:(double)delay;

/** 加载自定义视图的提示 */
+(void)showCustomViewHUD:(UIView *)view ImageName:(NSString *)imageName Message:(NSString *)str AfterDelay:(double)delay;

/** 用于数据请求是的HUD */
+(void)showDataRequestHUD:(UIView *)view Message:(NSString *)str NetWorkRequest:(NetWorkRequestBlock)requestBlock;

@end
