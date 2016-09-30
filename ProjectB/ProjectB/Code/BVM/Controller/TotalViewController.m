//
//  TotalViewController.m
//  ProjectB
//
//  Created by long on 16/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import "TotalViewController.h"
#import "TotalTableViewCell.h"
#import "HotListViewController.h"
#import "ReaderListTableViewController.h"
#import "VideoCategoryCollectionViewController.h"
#import "SongMenuTableViewController.h"
#import "RankingBaseViewController.h"


@interface TotalViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@end

@implementation TotalViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - private Method -
-(void)initUI{
    self.title = @"书影音";
    
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _tableView.rowHeight = 100.0;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerNib:[UINib nibWithNibName:@"TotalTableViewCell" bundle:nil] forCellReuseIdentifier:@"totalCell"];
    [self.view addSubview:_tableView];
    
}

#pragma mark - tableView Delegate -
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TotalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"totalCell" forIndexPath:indexPath];
    NSArray *arr = @[@"热门",@"图书",@"电影",@"音乐",@"排行榜"];
    cell.totalName.text = arr[indexPath.row];
    
    int a = arc4random() % 255;
    int b = arc4random() % 255;
    int c = arc4random() % 255;
    cell.backgroundColor = [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:1];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        HotListViewController *hotVC = [HotListViewController new];
        [self.navigationController pushViewController:hotVC animated:YES];
    }
    else if (indexPath.row == 1){
        ReaderListTableViewController *readerListVC = [ReaderListTableViewController new];
        [self.navigationController pushViewController:readerListVC animated:YES];
    }
    else if (indexPath.row == 2){
        UICollectionViewFlowLayout *layout= [[UICollectionViewFlowLayout alloc] init];
        VideoCategoryCollectionViewController *videoListVC = [[VideoCategoryCollectionViewController alloc] initWithCollectionViewLayout:layout];
        [self.navigationController pushViewController:videoListVC animated:YES];
    }
    else if (indexPath.row == 3){
        SongMenuTableViewController *songMenuVC = [[SongMenuTableViewController alloc] init];
        [self.navigationController pushViewController:songMenuVC animated:YES];
    }
    else{
        RankingBaseViewController *rankingVC = [[RankingBaseViewController alloc] init];
        [self.navigationController pushViewController:rankingVC animated:YES];
    }
   
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
