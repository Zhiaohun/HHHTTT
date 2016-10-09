//
//  AppDelegate.h
//  ProjectB
//
//  Created by long on 16/9/27.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMDrawerController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) MMDrawerController *drawerC;

@property (nonatomic,strong) UITabBarController *tabBar;
@end

