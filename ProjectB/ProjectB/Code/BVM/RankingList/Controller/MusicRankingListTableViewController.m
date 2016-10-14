//
//  MusicRankingListTableViewController.m
//  ProjectB
//
//  Created by long on 2016/9/29.
//  Copyright © 2016年 long. All rights reserved.
//

#import "MusicRankingListTableViewController.h"
#import "MusicHotListModel.h"
#import "HotMusicTableViewCell.h"
#import "SongListTableViewController.h"

@interface MusicRankingListTableViewController ()
@property (nonatomic, assign) NSInteger pageId;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation MusicRankingListTableViewController
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear: YES];
    [self.navigationController setValue:[UINavigationBar new] forKey:@"navigationBar"];
}

-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self initUI];
    [self dataRequest];
}

-(void)initUI{
    
    UINib *nib = [UINib nibWithNibName:@"HotMusicTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"musiccell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(void)dataRequest{
    NSString *str = @"pageSize=20&rankingListId=68&scale=2&target=category&version=5.4.33";
    NSString *URLStr = [NSString stringWithFormat:@"%@=%lu&%@",URL_RankListMusic,_pageId,str];
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
        [self dataRequest];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    cell.rankLb.hidden = NO;
    cell.rankLb.text = [NSString stringWithFormat:@"%lu",indexPath.row + 1];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SongListTableViewController *songVC = [[SongListTableViewController alloc] init];
    MusicHotListModel *model = self.dataArray[indexPath.row];
    songVC.albumId = (int)model.albumId;
    [self.navigationController pushViewController:songVC animated:YES];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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
