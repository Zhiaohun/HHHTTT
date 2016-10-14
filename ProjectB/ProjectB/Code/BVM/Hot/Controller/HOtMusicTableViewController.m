//
//  HOtMusicTableViewController.m
//  ProjectB
//
//  Created by 芏小川 on 2016/10/13.
//  Copyright © 2016年 long. All rights reserved.
//

#import "HOtMusicTableViewController.h"
#import "MusicHotListModel.h"
#import "HotMusicTableViewCell.h"
#import "SongListTableViewController.h"

@interface HOtMusicTableViewController ()
@property (nonatomic, assign) NSInteger pageId;
@property (nonatomic, strong) NSMutableArray *dataArray;


@end

@implementation HOtMusicTableViewController


-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self requestMusicData];
    self.title = @"热门音乐";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [JudgeManager defaultManager].originColor;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private Method - 
-(void)initUI{

    UINib *nib = [UINib nibWithNibName:@"HotMusicTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"musiccell"];
    [self goback];
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

-(void)requestMusicData{
    NSString *str = @"pageSize=20&rankingListId=68&scale=2&target=category&version=5.4.33";
    NSString *URLStr = [NSString stringWithFormat:@"%@=%lu&%@",URL_HotMusic,_pageId,str];
    [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:URLStr Parameter:nil Success:^(NSDictionary *dic) {
        NSLog(@">>>>>%@",dic);
        
        [self.tableView.mj_footer endRefreshing];
        
        NSArray *arr = [NSArray array];
        arr = dic[@"list"];
        for (NSDictionary *dic in arr) {
            MusicHotListModel *model = [[MusicHotListModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.dataArray addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self footerRefresh];
        });
        
    } Fail:^(NSError *error) {
        NSLog(@">>>%@",error);
    }];
}


-(void)footerRefresh{
    self.pageId++;
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self requestMusicData];
    }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HotMusicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"musiccell" forIndexPath:indexPath];
    MusicHotListModel *model = self.dataArray[indexPath.row];
    cell.model = model;

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SongListTableViewController *songVC = [[SongListTableViewController alloc] init];
    MusicHotListModel *model = self.dataArray[indexPath.row];
    songVC.albumId = (int)model.albumId;
    [self.navigationController pushViewController:songVC animated:YES];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.transform = CGAffineTransformTranslate(cell.transform, -[UIScreen mainScreen].bounds.size.width/2, 0);
    [UIView animateWithDuration:0.5 animations:^{
        cell.transform = CGAffineTransformIdentity;
    }];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
