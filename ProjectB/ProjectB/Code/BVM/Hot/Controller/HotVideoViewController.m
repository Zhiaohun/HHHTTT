//
//  HotVideoViewController.m
//  ProjectB
//
//  Created by 芏小川 on 2016/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import "HotVideoViewController.h"
#import "HotVideoTableViewCell.h"
#import "VideoListDataModels.h"
#import "MoviePlayerViewController.h"

@interface HotVideoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic, strong) VideoListBaseClass *videoBaseModel;

@end

@implementation HotVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self requestMovieData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - private Method -
-(void)initUI{
    self.title = @"热门电影";
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _tableView.rowHeight = 100;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerNib:[UINib nibWithNibName:@"HotVideoTableViewCell" bundle:nil] forCellReuseIdentifier:@"videocell"];
    [self.view addSubview:_tableView];
    
}

-(void)requestMovieData{
    
    [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:URL_hot Parameter:nil Success:^(NSDictionary *dic) {
        
        self.videoBaseModel = [VideoListBaseClass modelObjectWithDictionary:dic];
        NSLog(@">>>>>%@",dic);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    } Fail:^(NSError *error) {
        NSLog(@">>%@",error);
    }];
    
    
    
}


#pragma mark - tableView Delegate -
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.videoBaseModel.itemList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HotVideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"videocell" forIndexPath:indexPath];
    VideoListItemList *model = self.videoBaseModel.itemList[indexPath.row];
    [cell.VideoImageView sd_setImageWithURL:[NSURL URLWithString:model.data.cover.feed] placeholderImage:PlaceholderImage];
    cell.videoTitle.text = model.data.title;
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MoviePlayerViewController *movieVC = [[MoviePlayerViewController alloc] init];
    movieVC.dataArray = [NSArray array];
    movieVC.dataArray = self.videoBaseModel.itemList;
    movieVC.selectIndex = indexPath.row;
    
    [self.navigationController pushViewController:movieVC animated:YES];
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
