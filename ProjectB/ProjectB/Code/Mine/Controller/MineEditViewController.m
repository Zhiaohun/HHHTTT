//
//  MineEditViewController.m
//  ProjectB
//
//  Created by 芏小川 on 2016/9/29.
//  Copyright © 2016年 long. All rights reserved.
//

#import "MineEditViewController.h"
#import "MyselfPageViewController.h"

@interface MineEditViewController ()

@end

@implementation MineEditViewController

#pragma mark - life cycle -
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];  

    [self initUI];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma  mark - TapClick -
- (IBAction)backToView:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)editYouyselfPage:(id)sender {
    MyselfPageViewController *myselfPageVC = [MyselfPageViewController new];
    
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:myselfPageVC];
    navi.navigationBarHidden = NO;
    [self presentViewController:navi animated:YES completion:nil];
    //[self.navigationController pushViewController:myselfPage animated:YES];
}

#pragma mark - private Method -
-(void)initUI{
    self.userImg.layer.cornerRadius = 50;
    self.userImg.layer.borderWidth = 3;
    self.userImg.layer.borderColor = [UIColor whiteColor].CGColor;
    
    
    
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
