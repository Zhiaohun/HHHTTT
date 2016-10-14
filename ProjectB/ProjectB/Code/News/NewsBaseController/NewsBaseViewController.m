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
#import "UIViewController+MMDrawerController.h"
#import "SayingTableViewController.h"


@interface NewsBaseViewController ()
@property (nonatomic, strong) NSArray *categoriesArray;
@property (nonatomic, strong) NSArray *viewControllerArray;


@property (nonatomic,strong) UIImageView *ImgView;
@end

@implementation NewsBaseViewController
-(NSArray *)categoriesArray{
    if (!_categoriesArray) {
        _categoriesArray = @[@"推荐", @"科技", @"娱乐",@"游戏",@"语录"];
    }
    return _categoriesArray;
}
-(NSArray *)viewControllerArray{
    if (!_viewControllerArray) {
        RecommendTableViewController *RecommendVC = [[RecommendTableViewController alloc] init];
        ScienceTableViewController *scienceVC = [[ScienceTableViewController alloc] init];
        EntertainmentTableViewController *entertainmentVC = [[EntertainmentTableViewController alloc] init];
        GameTableViewController *gameVC = [[GameTableViewController alloc] init];
        SayingTableViewController *sayingVC = [[SayingTableViewController alloc] init];
        _viewControllerArray = @[RecommendVC,scienceVC,entertainmentVC,gameVC,sayingVC];
    }
    return _viewControllerArray;
}

-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear: YES];
    [self.navigationController setValue:[UINavigationBar new] forKey:@"navigationBar"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
    
//    self.menuHeight = 44;
//    self.menuViewStyle = WMMenuViewStyleLine;
//    self.titleSizeSelected = 15;
    self.titleColorNormal = [UIColor grayColor];
    self.titleColorSelected = [JudgeManager defaultManager].originColor;
    self.progressColor = [JudgeManager defaultManager].originColor;
    self.showOnNavigationBar = YES;
    self.menuBGColor = [UIColor clearColor];
    //self.menuViewLayoutMode = WMMenuViewLayoutModeScatter;
    self.preloadPolicy = WMPageControllerPreloadPolicyNeighbour;
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
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}
//自定义侧边栏按键
-(void)showMsg{
    _ImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    _ImgView.image = [UIImage imageNamed:@"left_nologin"];
    _ImgView.layer.cornerRadius = 20;
    _ImgView.clipsToBounds = YES;
    CALayer *layer = [_ImgView layer];
    layer.borderColor = [JudgeManager defaultManager].originColor.CGColor;
    layer.borderWidth = 2.0f;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_ImgView];
    
    DWSwipeGestures *click = [[DWSwipeGestures alloc]init];
    [click dw_SwipeGestureType:DWTapGesture Target:self Action:@selector(leftDrawerButtonPress:) AddView:_ImgView BackSwipeGestureTypeString:^(NSString * _Nonnull backSwipeGestureTypeString) {
    }];
    
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
