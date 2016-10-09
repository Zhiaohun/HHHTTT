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

@interface HotListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@end

@implementation HotListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private Menthod -
-(void)initUI{
    self.title = @"热门";
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _tableView.rowHeight = 342;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerNib:[UINib nibWithNibName:@"HotListTableViewCell" bundle:nil] forCellReuseIdentifier:@"hotCell"];
    [self.view addSubview:_tableView];
    
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
    //[cell.requestMoreBtn addTarget:self action:@selector(requestMore) forControlEvents:UIControlEventTouchUpInside];
    
    if (indexPath.row == 0) {
        cell.headImg.image = [UIImage imageNamed:@"friend_sex_male"];
        cell.view1Title.text = @"一";
    }
    else if (indexPath.row == 1){
        cell.headImg.image = [UIImage imageNamed:@"friend_sex_femal"];
        cell.view1Title.text = @"二";
    }
    else{
        cell.headImg.image = [UIImage imageNamed:@"friend_sex_male"];
        cell.view1Title.text = @"三";
    }

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
}

-(void)requestMore{

    HotVideoViewController *hotVideoVC = [HotVideoViewController new];
    [self.navigationController pushViewController:hotVideoVC animated:YES];
    
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
