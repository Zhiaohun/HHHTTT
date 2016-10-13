//
//  HotListViewController.m
//  ProjectB
//
//  Created by 芏小川 on 2016/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import "HotListViewController.h"
#import "HotListTableViewCell.h"
#import "HotVideoViewController.h"
#import "ReadHotDataModels.h"
#import "HotReadTableViewController.h"
#import "VideoListDataModels.h"
#import "HOtMusicTableViewController.h"


@interface HotListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) ReadHotBaseClass *readBase;
@property (nonatomic, strong) VideoListBaseClass *videoBaseModel;


@end

@implementation HotListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self requestDataInSimpleView];

}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear: YES];
    
    [self.navigationController setValue:[UINavigationBar new] forKey:@"navigationBar"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private Menthod -
-(void)initUI{
    self.title = @"热门";
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _tableView.rowHeight = 342;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerNib:[UINib nibWithNibName:@"HotListTableViewCell" bundle:nil] forCellReuseIdentifier:@"hotCell"];
    [self.view addSubview:_tableView];
    
}

-(void)requestDataInSimpleView{
    //图书
    [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:URL_HotRead Parameter:nil Success:^(NSDictionary *dic) {
        
        _readBase = [ReadHotBaseClass modelObjectWithDictionary:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    } Fail:^(NSError *error) {
        NSLog(@"请求热门图书简介界面数据失败");
    }];
    
    
    
    //视频
    [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:URL_hot Parameter:nil Success:^(NSDictionary *dic) {
        
        self.videoBaseModel = [VideoListBaseClass modelObjectWithDictionary:dic];
       // NSLog(@">>>>>%@",dic);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    } Fail:^(NSError *error) {
        NSLog(@">>%@",error);
    }];
    
    //音乐
    
    
    
}




#pragma mark - tableView Delegate -
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HotListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hotCell" forIndexPath:indexPath];
    
    
    if (indexPath.row == 0) {
        //视频
        cell.headImg.image = [UIImage imageNamed:@"friend_sex_male"];
        cell.view1Title.text = @"热门视频";
        
        [cell.requestMoreBtn addTarget:self action:@selector(requestMoreVideo) forControlEvents:UIControlEventTouchUpInside];
    }
    else if (indexPath.row == 1){
        //图书
        cell.viewTitle.text = @"畅销图书";
        cell.headImg.image = [UIImage imageNamed:@"3839_pc"];
        
        ReadHotProducts *product1 = _readBase.products[0];
        cell.view1Title.text = product1.productName;
        [cell.view1Img sd_setImageWithURL:[NSURL URLWithString:product1.imgUrl]];
        cell.view1scoreLb.text = [NSString stringWithFormat:@"%.1f",[product1.score floatValue]];
        ReadHotProducts *product2 = _readBase.products[1];
        cell.view2Title.text = product2.productName;
        [cell.view2Img sd_setImageWithURL:[NSURL URLWithString:product2.imgUrl]];
        cell.view2Score.text = [NSString stringWithFormat:@"%.1f",[product2.score floatValue]];
        ReadHotProducts *product3 = _readBase.products[2];
        cell.view3Title.text = product3.productName;
        [cell.view3Img sd_setImageWithURL:[NSURL URLWithString:product3.imgUrl]];
        cell.view3Score.text = [NSString stringWithFormat:@"%.1f",[product3.score floatValue]];
        
        [cell.requestMoreBtn addTarget:self action:@selector(requestMoreRead) forControlEvents:UIControlEventTouchUpInside];
    }
    else{
        //音乐
        cell.headImg.image = [UIImage imageNamed:@"friend_sex_male"];
        cell.view1Title.text = @"热门音乐";
        
        
        [cell.requestMoreBtn addTarget:self action:@selector(requestMoreMusic) forControlEvents:UIControlEventTouchUpInside];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{    
}

-(void)requestMoreVideo{
    HotVideoViewController *hotVideoVC = [HotVideoViewController new];
    [self.navigationController pushViewController:hotVideoVC animated:YES];
    
}
-(void)requestMoreRead{
    HotReadTableViewController *hotreadVC = [HotReadTableViewController new];
    [self.navigationController pushViewController:hotreadVC animated:YES];
}

-(void)requestMoreMusic{
    HOtMusicTableViewController *hotMusicVC = [HOtMusicTableViewController new];
    [self.navigationController pushViewController:hotMusicVC animated:YES];
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
