//
//  NewsBaseViewController.m
//  ProjectB
//
//  Created by long on 2016/9/29.
//  Copyright © 2016年 long. All rights reserved.
//

#import "NewsBaseViewController.h"
#import "GameTableViewController.h"
#import "RecommendTableViewController.h"
#import "ScienceTableViewController.h"
#import "EntertainmentTableViewController.h"
#import "JokeTableViewController.h"
#import "UIViewController+MMDrawerController.h"


@interface NewsBaseViewController ()
@property (nonatomic, strong) NSArray *categoriesArray;
@property (nonatomic, strong) NSArray *viewControllerArray;

@end

@implementation NewsBaseViewController
-(NSArray *)categoriesArray{
    if (!_categoriesArray) {
        _categoriesArray = @[@"推荐", @"科技", @"娱乐",@"游戏",@"笑话"];
    }
    return _categoriesArray;
}
-(NSArray *)viewControllerArray{
    if (!_viewControllerArray) {
        RecommendTableViewController *RecommendVC = [[RecommendTableViewController alloc] init];
        ScienceTableViewController *scienceVC = [[ScienceTableViewController alloc] init];
        EntertainmentTableViewController *entertainmentVC = [[EntertainmentTableViewController alloc] init];
        GameTableViewController *gameVC = [[GameTableViewController alloc] init];
        JokeTableViewController *jokeVC = [[JokeTableViewController alloc] init];
        _viewControllerArray = @[RecommendVC,scienceVC,entertainmentVC,gameVC,jokeVC];
    }
    return _viewControllerArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
    
    self.titleSizeNormal = 15;
    self.titleSizeSelected = 15;
    self.menuViewStyle = WMMenuViewStyleFlood;
    self.titleColorNormal = [UIColor cyanColor];
    self.progressColor = [UIColor colorWithRed:158.0/255.0 green:234.0/235.0 blue:4/255.0 alpha:1];
    self.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
    self.menuItemWidth = 75;
    self.menuHeight = 40;
    self.viewFrame = CGRectMake(0,64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Datasource & Delegate
-(NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.categoriesArray.count;
}
-(NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
    return self.categoriesArray[index];
}
-(UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    
    return self.viewControllerArray[index];
}

#pragma mark - private Method -

-(void)initUI{
    [self showMsg];
    self.title = @"资讯";
}
//自定义侧边栏按键
-(void)showMsg{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"头像"] style:UIBarButtonItemStyleDone target:self action:@selector(leftDrawerButtonPress:)];
    
}

-(void)leftDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
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
