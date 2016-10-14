//
//  AppDelegate.m
//  ProjectB
//
//  Created by long on 16/9/27.
//  Copyright © 2016年 long. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "TotalViewController.h"
#import "NewsBaseViewController.h"
#import "LeftViewController.h"
#import "MineViewController.h"
#import "LLShowHUD.h"

#import "MMExampleDrawerVisualStateManager.h"


#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
#import "WeiboSDK.h"
//新浪微博SDK需要在项目Build Settings中的Other Linker Flags添加"-ObjC"

@interface AppDelegate ()
@property (nonatomic, strong) UIView *nightView;


@end

@implementation AppDelegate

-(instancetype)init{
    self = [super init];
    if (self) {
        
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center addObserver:self selector:@selector(receiveNotifica:) name:@"night" object:nil];
        
        NSNotificationCenter *center2 = [NSNotificationCenter defaultCenter];
        [center2 addObserver:self selector:@selector(receiveNotifica2:) name:@"day" object:nil];
        
    }
    return self;
}

- (void)receiveNotifica:(NSNotification *)center
{
    self.nightView.hidden = NO;
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"value",@"key", nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"day___" object:@"projectB" userInfo: dic];
}


- (void)receiveNotifica2:(NSNotification *)center
{
    self.nightView.hidden = YES;
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"value",@"key", nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"night___" object:@"projectB" userInfo: dic];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    LeftViewController *leftVC = [LeftViewController new];
    
    
    MainViewController *mainVC = [[MainViewController alloc]init];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainVC];
    TotalViewController *totalVC = [TotalViewController new];
    UINavigationController *totalNav = [[UINavigationController alloc]initWithRootViewController:totalVC];
    
    NewsBaseViewController *newsVC = [NewsBaseViewController new];
    UINavigationController *newsNav = [[UINavigationController alloc]initWithRootViewController:newsVC];
    
    MineViewController *mineVC =[MineViewController new];
    UINavigationController *mineNav = [[UINavigationController alloc]initWithRootViewController:mineVC];
    //tableBar
    _tabBar = [[UITabBarController alloc] init];
    
    

    
    mainNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:[self handleTabImage:@"main"] tag:21];
    UIImage *img1 = [self handleTabImage:@"main_select"];
    img1 = [img1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mainNav.tabBarItem.selectedImage = img1;
    
    totalNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"书影音" image:[self handleTabImage:@"BVM"] tag:22];
    UIImage *img2 = [self handleTabImage:@"BVM_select"];
    img2 = [img2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    totalNav.tabBarItem.selectedImage = img2;
    
    newsNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"资讯" image:[self handleTabImage:@"news"] tag:23];
    UIImage *img3 = [self handleTabImage:@"news_select"];
    img3 = [img3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    newsNav.tabBarItem.selectedImage = img3;
    
    mineNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:[self handleTabImage:@"mine"] tag:24];
    UIImage *img4 = [self handleTabImage:@"mine_select"];
    img4 = [img4 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mineNav.tabBarItem.selectedImage = img4;
    
    _tabBar.viewControllers = @[mainNav,totalNav,newsNav,mineNav];

    
    //抽屉
    self.drawerC = [[MMDrawerController alloc]initWithCenterViewController:_tabBar leftDrawerViewController:leftVC];
    [_drawerC setMaximumLeftDrawerWidth:VIEW_WIDTH-100];
    [_drawerC setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [_drawerC setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    //动画效果
    [_drawerC setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
        MMDrawerControllerDrawerVisualStateBlock block;
        block = [[MMExampleDrawerVisualStateManager sharedManager]drawerVisualStateBlockForDrawerSide:drawerSide];
        if (block) {
            block(drawerController,drawerSide,percentVisible);
        }
    }];
    [[MMExampleDrawerVisualStateManager sharedManager] setLeftDrawerAnimationType:MMDrawerAnimationTypeSwingingDoor];
    
    self.window.rootViewController = _drawerC;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    
    
    
    self.nightView = [[UIView alloc] initWithFrame:self.window.bounds];
    self.nightView.userInteractionEnabled = NO;
    self.nightView.hidden = YES;
    self.nightView.backgroundColor = [UIColor blackColor];
    self.nightView.alpha = 0.7;
    
    [self.window addSubview:self.nightView];
   
    
    
    [self shareWeiBo];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(void)shareWeiBo{
    
    
   // if ( [WeiboSDK isWeiboAppInstalled]) {
        [ShareSDK registerApp:@"17df0ccd24358"
         
              activePlatforms:@[
                                @(SSDKPlatformTypeSinaWeibo)]
                     onImport:^(SSDKPlatformType platformType)
         {
             switch (platformType)
             {
                     
                 case SSDKPlatformTypeSinaWeibo:
                     [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                     break;
                 default:
                     break;
             }
         }
              onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
         {
             
             switch (platformType)
             {
                 case SSDKPlatformTypeSinaWeibo:
                     //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                     [appInfo SSDKSetupSinaWeiboByAppKey:@"568898243"
                                               appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3"
                                             redirectUri:@"http://www.sharesdk.cn"
                                                authType:SSDKAuthTypeBoth];
                 default:
                     break;
             }
         }];

   // }else{
        
   // }
    
  }

-(void)launchAnimate{
    
}


- (UIImage*)originImage:(UIImage *)image scaleToSize:(CGSize)size {
    //  下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
    //  返回的就是已经改变的图片
}

- (UIImage *)handleTabImage:(NSString *)imageName {
    UIImage *image0 = [UIImage imageNamed:imageName];
    UIImage *image1 = [self originImage:image0 scaleToSize:CGSizeMake(30, 30)];
    UIImage *image2 = [image1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image2;
}

@end
