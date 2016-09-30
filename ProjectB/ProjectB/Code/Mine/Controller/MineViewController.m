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

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,assign) BOOL isuser;
@end

@implementation MineViewController


-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = NO;
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
    
    if (_unLogin.hidden == NO) {
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
    self.userImg.layer.cornerRadius = 40;
//    _unLogin.hidden = YES;
//    _username.hidden = NO;
    DWSwipeGestures *click = [[DWSwipeGestures alloc]init];
    [click dw_SwipeGestureType:DWTapGesture Target:self Action:@selector(toSelfEdit) AddView:self.userInfoView BackSwipeGestureTypeString:^(NSString * _Nonnull backSwipeGestureTypeString) {
    }];
    
    //系统信息
    [self.systemInfoTableView registerNib:[UINib nibWithNibName:@"SystemInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"systemCell"];
    _systemInfoTableView.rowHeight = 42;
    _systemInfoTableView.delegate = self;
    _systemInfoTableView.dataSource = self;
    _systemInfoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

}
#pragma mark - TapClick -
- (IBAction)signOUt:(id)sender {
    
    
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
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
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
