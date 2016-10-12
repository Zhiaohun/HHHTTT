//
//  UIViewController+animation.h
//  
//
//  Created by TTS on 15/10/28.
//
//

#import <UIKit/UIKit.h>
//动画效果
#define MGTransitionFade kCATransitionFade
#define MGTransitionPush kCATransitionPush
#define MGTransitionReveal kCATransitionReveal
#define MGTransitionMoveIn kCATransitionMoveIn
#define MGCube  @"cube"     //立方滚动
#define MGSuckEffect  @"suckEffect"   //卷走
#define MGOglFlip  @"oglFlip"    //页面旋转
#define MGRippleEffect  @"rippleEffect"  //水波纹
#define MGPageCurl  @"pageCurl"      //卷脚翻页效果
#define MGPageUnCurl  @"pageUnCurl"   //卷脚翻页效果
#define MGCameraIrisHollowOpen  @"cameraIrisHollowOpen"   //相机打开
#define MGCameraIrisHollowClose  @"cameraIrisHollowClose" //相机关闭

//页面切换方向
#define MGFromRight kCATransitionFromRight
#define MGFromLeft kCATransitionFromLeft
#define MGFromMoveIn kCATransitionMoveIn
#define MGFromFade kCATransitionFade


//使用pushController时使用
typedef enum{
    left = 0,
    right,
    fade,
    moveIn
}DisType;


//controller切换模式
typedef enum{
    push,
    model,
}PushType;

@interface UIViewController (animation)
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view;

- (void)pushLeft:(NSString*)storeboardName andViewControllerName:(NSString*)name  andPushType:(PushType)pushType;
- (void)pushRight:(NSString*)storeboardName andViewControllerName:(NSString*)name  andPushType:(PushType)pushType;
- (void)pushFade:(NSString*)storeboardName andViewControllerName:(NSString*)name  andPushType:(PushType)pushType;
- (void)pushMoveIn:(NSString*)storeboardName andViewControllerName:(NSString*)name  andPushType:(PushType)pushType;
- (void)pushController:(NSString*)storeboardName andViewControllerName:(NSString*)name andDisType:(DisType)disType
           andPushType:(PushType)pushType;
- (void)pushAnimationController:(NSString*)storeboardName andViewControllerName:(NSString*)name andAnimationType:(NSString*)animationType andDisType:(NSString*)disType andPushType:(PushType)pushType;
- (void)startModelNormal:(NSString*)storeboardName andViewControllerName:(NSString*)name;
- (void)backWithAnimation:(NSString*)mgType andMGSubtype:(NSString*)mgSubType;
- (void)backLeft;

- (void)modelBack;

- (void)modelBackWithAnimation:(NSString*)mgType andMGSubtype:(NSString*)mgSubType;
@end
