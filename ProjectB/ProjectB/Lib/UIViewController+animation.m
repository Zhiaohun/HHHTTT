//
//  UIViewController+animation.m
//  
//
//  Created by TTS on 15/10/28.
//
//

#import "UIViewController+animation.h"

@implementation UIViewController (animation)

//back
- (void)backLeft{
    [self.navigationController popViewControllerAnimated:YES];
}

//带动画的push返回
- (void)backWithAnimation:(NSString*)mgType andMGSubtype:(NSString*)mgSubType{
    [self transitionWithType:mgType WithSubtype:kCATransitionFromRight ForView:self.navigationController.view];
    [self.navigationController popViewControllerAnimated:NO];
}
//带动画的push返回
- (void)modelBackWithAnimation:(NSString*)mgType andMGSubtype:(NSString*)mgSubType{
    [self transitionWithType:mgType WithSubtype:kCATransitionFromRight ForView:self.navigationController.view];
      [self dismissViewControllerAnimated:NO completion:nil];
}

//back
- (void)modelBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//向左切换
- (void)pushLeft:(NSString*)storeboardName andViewControllerName:(NSString*)name  andPushType:(PushType)pushType{
    //启用 CATransition 类中的Push动画
    NSString *subtypeString = kCATransitionFromLeft;
    switch (pushType) {
        case push:
           [self startPush:kCATransitionPush andSubtypeString:subtypeString and:storeboardName andViewControllerName:name];
            break;
            
        case model:
           [self startModel:kCATransitionPush andSubtypeString:subtypeString and:storeboardName andViewControllerName:name];
            break;
    }
}

- (void)pushFade:(NSString*)storeboardName andViewControllerName:(NSString*)name  andPushType:(PushType)pushType{
    //启用 CATransition 类中的Push动画
    NSString *subtypeString = kCATransitionFade;
    switch (pushType) {
        case push:
           [self startPush:kCATransitionPush andSubtypeString:subtypeString and:storeboardName andViewControllerName:name];
            break;
            
        case model:
            [self startModel:kCATransitionPush andSubtypeString:subtypeString and:storeboardName andViewControllerName:name];
            break;
    }

}

- (void)pushMoveIn:(NSString*)storeboardName andViewControllerName:(NSString*)name  andPushType:(PushType)pushType{
    //启用 CATransition 类中的Push动画
    NSString *subtypeString = kCATransitionMoveIn;
    switch (pushType) {
        case push:
            [self startPush:kCATransitionPush andSubtypeString:subtypeString and:storeboardName andViewControllerName:name];
            break;
            
        case model:
            [self startModel:kCATransitionPush andSubtypeString:subtypeString and:storeboardName andViewControllerName:name];
            break;
    }
}

//向右切换
- (void)pushRight:(NSString*)storeboardName andViewControllerName:(NSString*)name  andPushType:(PushType)pushType{
    //启用 CATransition 类中的Push动画
    NSString *subtypeString = kCATransitionFromRight;
    switch (pushType) {
        case push:
            [self startPush:kCATransitionPush andSubtypeString:subtypeString and:storeboardName andViewControllerName:name];
            break;
            
        case model:
            [self startModel:kCATransitionPush andSubtypeString:subtypeString and:storeboardName andViewControllerName:name];
            break;
    }
}




- (void)pushController:(NSString*)storeboardName andViewControllerName:(NSString*)name andDisType:(DisType)disType
           andPushType:(PushType)pushType{
    
    switch (disType) {
        case left:
            [self pushLeft:(NSString*)storeboardName andViewControllerName:(NSString*)name  andPushType:(PushType)pushType];
            break;
            
        case right:
            [self pushRight:(NSString*)storeboardName andViewControllerName:(NSString*)name  andPushType:(PushType)pushType];
            break;
        case fade:
            [self pushFade:(NSString*)storeboardName andViewControllerName:(NSString*)name  andPushType:(PushType)pushType];
            break;
        case moveIn:
            [self pushMoveIn:(NSString*)storeboardName andViewControllerName:(NSString*)name  andPushType:(PushType)pushType];
            break;
    }
    
    
    
}


- (void)pushAnimationController:(NSString*)storeboardName andViewControllerName:(NSString*)name andAnimationType:(NSString*)animationType andDisType:(NSString*)disType andPushType:(PushType)pushType{
    //启用 CATransition 类中的Push动画
    switch (pushType) {
        case push:
            [self startPush:animationType andSubtypeString:disType and:storeboardName andViewControllerName:name];
            break;
        case model:
            [self startModel:animationType andSubtypeString:disType and:storeboardName andViewControllerName:name];
            break;
    }
}

/**
 *  @author mangues, 15-11-03 10:11:46
 *
 *  可以给controller设置属性参数
 *
 *  @param storeboardName storeboard 名字
 *  @param name           对应的controller id
 *  @param animationType  动画效果
 *  @param disType        controller 运动方向
 *  @param pushType       push方式 或者model方式
 */
- (void)pushAnimationControllerWithParam:(UIStoryboard*)storeboardName andViewControllerName:(UIViewController*)name andAnimationType:(NSString*)animationType andDisType:(NSString*)disType andPushType:(PushType)pushType{
    //启用 CATransition 类中的Push动画
    switch (pushType) {
        case push:
            [self startPushWithParam:animationType andSubtypeString:disType and:storeboardName andViewControllerName:name];
            break;
        case model:
            [self startModelWithParam:animationType andSubtypeString:disType and:storeboardName andViewControllerName:name];
            break;
    }
}



/**
 *  @author mangues, 15-10-30 10:10:23
 *
 *  正常调用model
 *
 *  @param storeboardName storeboard
 *  @param name           controller
 */
- (void)startModelNormal:(NSString*)storeboardName andViewControllerName:(NSString*)name{
    UIStoryboard *story = [UIStoryboard storyboardWithName:storeboardName bundle:[NSBundle mainBundle]];
    //由storyboard根据myView的storyBoardID来获取我们要切换的视图
    UIViewController* myReport = [story instantiateViewControllerWithIdentifier:name];
    
    UINavigationController *collor = [[UINavigationController alloc] initWithRootViewController:myReport];
    //调用此方法显示模态窗口
    [self presentViewController:collor animated:YES completion:nil];
}



- (void)startPush:(NSString*)typeString andSubtypeString:(NSString*)subtypeString  and:(NSString*)storeboardName andViewControllerName:(NSString*)name{
    UIStoryboard *story = [UIStoryboard storyboardWithName:storeboardName bundle:[NSBundle mainBundle]];
    [self transitionWithType:typeString WithSubtype:subtypeString ForView:self.navigationController.view];
    //由storyboard根据myView的storyBoardID来获取我们要切换的视图
    UIViewController* myReport = [story instantiateViewControllerWithIdentifier:name];
    //由navigationController推向我们要推向的view
    [self.navigationController pushViewController:myReport animated:NO];
}


- (void)startModel:(NSString*)typeString andSubtypeString:(NSString*)subtypeString  and:(NSString*)storeboardName andViewControllerName:(NSString*)name{

    UIStoryboard *story = [UIStoryboard storyboardWithName:storeboardName bundle:[NSBundle mainBundle]];
    [self transitionWithType:typeString WithSubtype:subtypeString ForView:self.view.window];
    //由storyboard根据myView的storyBoardID来获取我们要切换的视图
    UIViewController* myReport = [story instantiateViewControllerWithIdentifier:name];
    
    UINavigationController *collor = [[UINavigationController alloc] initWithRootViewController:myReport];
    //调用此方法显示模态窗口
    [self presentViewController:collor animated:NO completion:nil];
}




- (void)startPushWithParam:(NSString*)typeString andSubtypeString:(NSString*)subtypeString  and:(UIStoryboard*)storeboardName andViewControllerName:(UIViewController*)name{

    [self transitionWithType:typeString WithSubtype:subtypeString ForView:self.navigationController.view];
    //由navigationController推向我们要推向的view
    [self.navigationController pushViewController:name animated:NO];
}


- (void)startModelWithParam:(NSString*)typeString andSubtypeString:(NSString*)subtypeString  and:(UIStoryboard*)storeboardName andViewControllerName:(UIViewController*)name{
    [self transitionWithType:typeString WithSubtype:subtypeString ForView:self.view.window];
    //调用此方法显示模态窗口
    [self presentViewController:name animated:NO completion:nil];
}





// CATransition动画实现
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view {
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    //设置运动时间
    animation.duration = 0.3;
    //设置运动type
    animation.type = type;
    if (subtype != nil) {
        //设置子类
        animation.subtype = subtype;
    }
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    [view.layer addAnimation:animation forKey:@"animation"];
}




@end
