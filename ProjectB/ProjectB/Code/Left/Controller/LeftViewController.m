//
//  LeftViewController.m
//  ProjectB
//
//  Created by 芏小川 on 2016/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import "LeftViewController.h"
#import "TimingCloseTableViewController.h"

@interface LeftViewController ()


@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
}

-(void)requestWeatherData{
    
    [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:URL_Weather Parameter:nil Success:^(NSDictionary *dic) {
        
        NSDictionary *items = dic[@"items"][0];
        
        NSDictionary *nowMsg = items[@"now"];
        NSDictionary *sumMsg = items[@"summary"];
        NSDictionary *todayMsg = items[@"today"];
        NSDictionary *right = sumMsg[@"right"];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            _currentTime.text = [NSString stringWithFormat:@"2016/%@",right[@"date"]];
            _currentTemperature.text = [NSString stringWithFormat:@"%@℃",nowMsg[@"temp"]];
            _TMaxAndMin.text = todayMsg[@"temp"];
            _updateTime.text = right[@"pubdate"];
        });
        
    } Fail:^(NSError *error) {
        NSLog(@"天气信息请求失败");
    }];
}



#pragma mark - Tapclick -

- (IBAction)firstBtn:(id)sender {
    //近期浏览
    
    
}
- (IBAction)secondBtn:(id)sender {
    //我的收藏
    
}
- (IBAction)ThirdBtn:(id)sender {
    //我的下载
    
}
- (IBAction)forthBtn:(id)sender {
    //定时关闭
    TimingCloseTableViewController *timingCloseVC = [TimingCloseTableViewController new];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:timingCloseVC];
    
    [self presentViewController:navi animated:YES completion:nil];
    
}


- (IBAction)goodNight:(id)sender {
    
    
}


- (IBAction)whatsWeather:(id)sender {
    self.weatherView.hidden = NO;
    [UIView animateWithDuration:3.0     //动画时长
                          delay:0.0     //动画延时
         usingSpringWithDamping:1    //类似弹簧振动效果  阻尼系数 0 ~ 1 0没阻力 停不下来 1最大 停的最快
          initialSpringVelocity:50.0  //初始速度
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
