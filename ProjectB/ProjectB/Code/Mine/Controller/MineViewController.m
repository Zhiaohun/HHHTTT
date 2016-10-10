//
//  MineViewController.m
//  ProjectB
//
//  Created by 芏小川 on 2016/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import "MineViewController.h"
#import "MineEditViewController.h"
#import "LoginViewController.h"
#import "SystemInfoTableViewCell.h"
#import "MainViewController.h"
#import "CacheDelete.h"
#import "LLShowHUD.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,assign) BOOL isuser;
@end

@implementation MineViewController


-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = NO;
    
    if (![JudgeManager defaultManager].isLogin) {
        _LoginView.hidden = YES;
        _signOutView.hidden = YES;
    }
    else{
        _LoginView.hidden = NO;
        _signOutView.hidden = NO;
        _username.text = [UserInfoManager getUname];
    }
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)toSelfEdit{
    
    NSLog(@"----------%d",[JudgeManager defaultManager].isLogin);
    if (![JudgeManager defaultManager].isLogin) {
        NSLog(@"未登录");
        LoginViewController *loginVC = [LoginViewController new];
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:loginVC];
        navi.navigationBarHidden = YES;
        [self presentViewController:navi animated:YES completion:nil];
        
        
    }
    else{
        NSLog(@"已登录");
        MineEditViewController *mineEidtVC = [MineEditViewController new];
        [self.navigationController pushViewController:mineEidtVC animated:YES];
    }
    
    
}

#pragma mark - private Method -
-(void)initUI{
    self.title = @"我的";
    //用户信息
    self.LoginImg.layer.cornerRadius = 40;
    self.LoginImg.layer.borderWidth = 3;
    self.LoginImg.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.unLoginImg.layer.cornerRadius = 40;
    self.unLoginImg.layer.borderColor = [UIColor whiteColor].CGColor;
    self.unLoginImg.layer.borderWidth = 3;
    

    if ([JudgeManager defaultManager].isLogin == 0) {
        _LoginView.hidden = YES;
    }
    else{
        _LoginView.hidden = NO;
        _signOutView.hidden = NO;
    }

    
    /********手势方法一******/
//    DWSwipeGestures *click = [[DWSwipeGestures alloc]init];
//    [click dw_SwipeGestureType:DWTapGesture Target:self Action:@selector(toSelfEdit) AddView:self.userInfoView BackSwipeGestureTypeString:^(NSString * _Nonnull backSwipeGestureTypeString) {
//    }];
    /********手势方法二********/
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toSelfEdit)];
    gesture.numberOfTapsRequired = 1;
    [self.unLoginView addGestureRecognizer:gesture];
    
    //系统信息
    [self.systemInfoTableView registerNib:[UINib nibWithNibName:@"SystemInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"systemCell"];
    _systemInfoTableView.rowHeight = 42;
    _systemInfoTableView.delegate = self;
    _systemInfoTableView.dataSource = self;
    _systemInfoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

}

//HUD纯文字
- (void)showQusHUDWithMessage:(NSString *)msg {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = msg;
    hud.offset = CGPointMake(0.f, 250);
    [hud hideAnimated:YES afterDelay:1.f];
}

- (void)showSucHUDWithMessage:(NSString *)msg {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.square = YES;
    hud.label.text = msg;
    [hud hideAnimated:YES afterDelay:1.f];
}


#pragma mark - TapClick -
- (IBAction)signOUt:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否退出" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [UserInfoManager saveAuth:nil];
        NSLog(@"++++%@",[UserInfoManager getAuth]);
        [JudgeManager defaultManager].isLogin = NO;
        //退出登录后跳转到首页
        self.navigationController.tabBarController.selectedIndex = 0;
    }];
    [alert addAction:ok];
    
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancle];
    [self presentViewController:alert animated:YES completion:nil];
    
}



#pragma mark - tableView Delegate -
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SystemInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"systemCell" forIndexPath:indexPath];
    NSArray *arr = @[@"意见反馈",@"清除缓存",@"功能介绍",@"关于"];
    cell.label1.text = arr[indexPath.row];
    if(indexPath.row == 0){
        cell.label2.hidden = NO;
    }else if (indexPath.row == 1){
        NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
        float size = [CacheDelete folderSizeAtPath:path];
        cell.label2.hidden = NO;
        cell.label2.text = [NSString stringWithFormat:@"%0.1fM",size];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        //意见反馈
        
    }
    else if (indexPath.row == 1) {
        //清除缓存
        //[self showQusHUDWithMessage:@"有问题"];
         NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
        float size = [CacheDelete folderSizeAtPath:path];
        [self cacheDeleteAlert:size];
    }
    else if (indexPath.row == 2){
        //功能介绍
        [self showSucHUDWithMessage:@"是否清除"];
    }
    else{
        //关于
        
    
    }
    
}



//清除缓存的alert
-(void)cacheDeleteAlert:(float)size{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"缓存大小为%0.1f.确定需要清除缓存吗?",size] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
        
        [CacheDelete clearCache:path];
        [LLShowHUD showCustomViewHUD:self.view ImageName:@"yes" Message:@"缓存清除成功!" AfterDelay:0.5];

        [self.systemInfoTableView reloadData];
    }];
    
    [alert addAction:ok];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
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
