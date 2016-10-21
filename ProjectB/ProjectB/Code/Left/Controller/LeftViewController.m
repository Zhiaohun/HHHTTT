//
//  LeftViewController.m
//  ProjectB
//
//  Created by 芏小川 on 2016/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import "LeftViewController.h"
#import "TimingCloseTableViewController.h"
#import "DownloadTableViewController.h"
#import "UIImageEffects.h"
#import "CollectionViewController.h"
#import "WeatherDataModels.h"
#import "MyThemeViewController.h"

@interface LeftViewController ()
@property (nonatomic, assign) BOOL state; //夜间 state=YES  白天 state=NO
@property (nonatomic,strong) WeatherBaseClass *base;

@end

@implementation LeftViewController

-(void)viewWillAppear:(BOOL)animated{
    
    if (![JudgeManager defaultManager].LeftBGImg){
        self.bgImg.image = [UIImage imageNamed:@"left_bg"];
    }
    else{
        [self.bgImg sd_setImageWithURL:[NSURL URLWithString:[JudgeManager defaultManager].LeftBGImg]];
    }
    
    
    if (!IsEmptyString([UserInfoManager getUname])) {
        self.username.text = [UserInfoManager getUname];
    }
    else{
        self.username.text = @"游客(请先登录)";
    }
    UserInfoModel *model = [[UserInfoDBManager defaultManager] selectDataWithUsername:[NSString stringWithFormat:@"%@",[UserInfoManager getUname]]];
    
    if (!IsEmptyString(model.userImg)) {
        [self.userImg sd_setImageWithURL:[NSURL URLWithString:model.userImg]];
    }
    else{
        self.userImg.image = [UIImage imageNamed:@"left_nologin"];
    }
    //NSLog(@"personal++++%@",model.personalSentence);
    if (!IsEmptyString(model.personalSentence)) {
        self.personalSentence.text = model.personalSentence;
    }
    else{
         self.personalSentence.text = @"这个人很懒,什么都没有留下";
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.state = YES;
    
    [self initUI];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark - private Method -
-(void)initUI{
    
    self.userImg.layer.cornerRadius = 30;
    self.userImg.layer.borderColor = [UIColor cyanColor].CGColor;
    self.userImg.layer.borderWidth = 3;
    
    //毛玻璃效果
//    self.bgImg.image = [self blurViewByLightEffectWithImage:[UIImage imageNamed:@"20121214223818_CmWuM"]];
    
    
    
}

- (UIImage *)blurViewByLightEffectWithImage:(UIImage *)screenImage
{
    UIImage * blurImage = [UIImageEffects imageByApplyingLightEffectToImage:screenImage];
    return blurImage;
}

-(void)requestWeatherData{
    
    [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:URL_Weather Parameter:nil Success:^(NSDictionary *dic) {
        
        _base = [WeatherBaseClass modelObjectWithDictionary:dic];
        WeatherHeWeatherDataService30 *data = _base.heWeatherDataService30[0];
        WeatherDailyForecast *daily = data.dailyForecast[0];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            _currentTime.text = [NSString stringWithFormat:@"%@",data.basic.update.loc];
            _currentTemperature.text = [NSString stringWithFormat:@"%@℃",data.now.tmp];
            _TMaxAndMin.text = [NSString stringWithFormat:@"%@ %@",daily.tmp.max,daily.tmp.min];
            _updateTime.text = [NSString stringWithFormat:@"%@转%@",daily.cond.txtD,daily.cond.txtN];
            //[_weatherBgImg sd_setImageWithURL:[NSURL URLWithString:ae[@"background"]]];
        });
        
    } Fail:^(NSError *error) {
        NSLog(@"天气信息请求失败");
    }];
}

//- (void)showSucHUDWithMessage:(NSString *)msg {
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
//    hud.mode = MBProgressHUDModeCustomView;
//    UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
//    hud.customView = [[UIImageView alloc] initWithImage:image];
//    hud.square = YES;
//    hud.label.text = msg;
//    [hud hideAnimated:YES afterDelay:1.f];
//}



#pragma mark - Tapclick -

- (IBAction)firstBtn:(id)sender {
    //我的主题
    MyThemeViewController *themeVC = [MyThemeViewController new];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:themeVC];
    navi.navigationBar.hidden = NO;
    [self presentViewController:navi animated:YES completion:nil];
    
}
- (IBAction)secondBtn:(id)sender {
    //我的收藏
    CollectionViewController *collectionVC = [CollectionViewController new ];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:collectionVC];
    [self presentViewController:navi animated:YES completion:nil];
    
}
- (IBAction)ThirdBtn:(id)sender {
    //我的下载
    DownloadTableViewController *downloadVC = [[DownloadTableViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:downloadVC];
    [self presentViewController:navi animated:YES completion:nil];
}
- (IBAction)forthBtn:(id)sender {
    //定时关闭
    TimingCloseTableViewController *timingCloseVC = [TimingCloseTableViewController new];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:timingCloseVC];
    
    [self presentViewController:navi animated:YES completion:nil];
    
}


- (IBAction)goodNight:(id)sender {
    /*
    if (self.state) {
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"value",@"key", nil];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"night" object:@"projectB" userInfo: dic];
        self.state = NO;
    }else {
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"value",@"key", nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"day" object:@"projectB" userInfo: dic];
        self.state = YES;
    }
     */
   // UIButton *btn = (UIButton *)sender;
    if (self.state) {
        //        NSLog(@"是");
        
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"value",@"key", nil];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"night" object:@"projectB" userInfo: dic];
        self.state = NO;
    }else {
        
        
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"value",@"key", nil];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"day" object:@"projectB" userInfo: dic];
        self.state = YES;
    }
    
}


- (IBAction)whatsWeather:(id)sender {
    self.weatherView.hidden = NO;
    [UIView animateWithDuration:1.5     //动画时长
                          delay:0.0     //动画延时
         usingSpringWithDamping:1    //类似弹簧振动效果  阻尼系数 0 ~ 1 0没阻力 停不下来 1最大 停的最快
          initialSpringVelocity:250.0  //初始速度
                        options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            
                            CGPoint point = self.view.center;
                            point.y += 200;
                            [_weatherView setCenter:point];
                        } completion:^(BOOL finished) {
                            [_weatherView setAlpha:1];
                        }];
    
    
    [self requestWeatherData];    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:3.0     //动画时长
                          delay:0.0     //动画延时
         usingSpringWithDamping:1    //类似弹簧振动效果  阻尼系数 0 ~ 1 0没阻力 停不下来 1最大 停的最快
          initialSpringVelocity:5.0  //初始速度
                        options:UIViewAnimationOptionCurveEaseInOut animations:^{
                            CGPoint point = _weatherView.center;
                            point.y += 300;
                            [_weatherView setCenter:point];
                        } completion:^(BOOL finished) {
                            [_weatherView setAlpha:1];
                        }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
