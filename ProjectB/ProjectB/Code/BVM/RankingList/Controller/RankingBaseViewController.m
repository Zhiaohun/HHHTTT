//
//  RankingBaseViewController.m
//  ProjectB
//
//  Created by long on 2016/9/29.
//  Copyright © 2016年 long. All rights reserved.
//

#import "RankingBaseViewController.h"
#import "MusicRankingListTableViewController.h"
#import "VideoRankingListTableViewController.h"
#import "ReadRankingListTableViewController.h"
#import "UIViewController+MMDrawerController.h"

@interface RankingBaseViewController ()
@property (nonatomic, strong) NSArray *categoriesArray;
@property (nonatomic, strong) NSArray *viewControllerArray;

@end

@implementation RankingBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.menuHeight = 44;
    self.menuViewStyle = WMMenuViewStyleLine;
    self.titleSizeSelected = 15;
    self.titleColorNormal = [UIColor grayColor];
    self.titleColorSelected = [JudgeManager defaultManager].originColor;
    self.progressColor = [JudgeManager defaultManager].originColor;
    self.showOnNavigationBar = YES;
    self.menuBGColor = [UIColor clearColor];
    self.menuViewLayoutMode = WMMenuViewLayoutModeScatter;
    [super viewDidLoad];
    
    [self initUI];
}

#pragma mark - private Method -
-(void)initUI{
    [self goback];
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}


-(NSArray *)categoriesArray{
    if (!_categoriesArray) {
        _categoriesArray = @[@"音乐", @"视频", @"阅读"];
    }
    return _categoriesArray;
}
-(NSArray *)viewControllerArray{
    if (!_viewControllerArray) {
        MusicRankingListTableViewController *musicVC = [[MusicRankingListTableViewController alloc] init];
        VideoRankingListTableViewController *videoVC = [[VideoRankingListTableViewController alloc] init];
        ReadRankingListTableViewController *readVC = [[ReadRankingListTableViewController alloc] init];
        _viewControllerArray = @[musicVC,videoVC,readVC];
    }
    return _viewControllerArray;
}

//自定义返回键
-(void)goback{
    UIImage *image = [[UIImage imageNamed:@"返回"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(TapLeftAction)];
}
-(void)TapLeftAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

////自定义侧边栏按键
//-(void)showMsg{
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"头像"] style:UIBarButtonItemStyleDone target:self action:@selector(leftDrawerButtonPress:)];
//    
//}
//
//-(void)leftDrawerButtonPress:(id)sender{
//    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.categoriesArray.count;
}
-(NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
    return self.categoriesArray[index];
}
-(UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    
    return self.viewControllerArray[index];
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
