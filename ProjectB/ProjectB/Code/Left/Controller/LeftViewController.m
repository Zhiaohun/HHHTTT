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
    self.userImg.layer.cornerRadius = 30;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark - private Method -
-(void)initUI{
    
    self.userImg.layer.cornerRadius = 30;
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
