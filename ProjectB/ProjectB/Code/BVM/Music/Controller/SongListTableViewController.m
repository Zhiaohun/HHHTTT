//
//  SongListTableViewController.m
//  ProjectB
//
//  Created by long on 16/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import "SongListTableViewController.h"
#import "SongListHeaderView.h"
#import "SongListTableViewCell.h"
#import "MusicListDataModels.h"
#import "SongPlayTableViewController.h"
#import "MusicDownloadDataModels.h"
#import "SongDownloadManager.h"
#import "DownloadModel.h"
#import "DownloadDBManager.h"
#import "LLShowHUD.h"

@interface SongListTableViewController ()
{
    int _maxPageId;
}
@property (nonatomic, strong) SongListHeaderView *headerView;
@property (nonatomic, strong) MusicListBaseClass *listBaseModel;
@property (nonatomic, strong) NSMutableArray *musicListArray;
@property (nonatomic, assign) NSInteger pageId;
@property (nonatomic, strong) MusicDownloadBaseClass *downloadBaseModel;
@property (nonatomic, assign) BOOL isDownloading;

@end

@implementation SongListTableViewController

//数组懒加载
-(NSMutableArray *)musicListArray{
    if (!_musicListArray) {
        _musicListArray = [NSMutableArray array];
    }
    return _musicListArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"_+_+_+%lu",self.albumId);
    self.pageId = 1;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;

    [self dataRequest];
   
    
    UINib *songListNib = [UINib nibWithNibName:@"SongListTableViewCell" bundle:nil];
    [self.tableView registerNib:songListNib forCellReuseIdentifier:@"songlistcell"];
    
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

//tableView的头视图
-(void)tableHeaderView{
    _headerView = [[NSBundle mainBundle] loadNibNamed:@"SongListHeaderView" owner:nil options:nil][0];
    _headerView.frame = CGRectMake(0, 0, VIEW_WIDTH, 120);
    self.tableView.tableHeaderView = _headerView;

    [_headerView.songListHeaderViewImageView sd_setImageWithURL:[NSURL URLWithString:self.listBaseModel.data.album.coverOrigin] placeholderImage:PlaceholderImage];
    _headerView.songListHeaderViewTitleLabel.text = self.listBaseModel.data.album.title;
    _headerView.songListHeaderViewNickNameLabel.text = self.listBaseModel.data.user.nickname;
    _headerView.songListHeaderViewPlayCountsLabel.text = [NSString stringWithFormat:@"%0.1f万",self.listBaseModel.data.album.playTimes / 10000];
    
    
}
//数据器请求
-(void)dataRequest{
    NSString *str = @"device=iPhone&pageSize=20&source=5&statEvent=pageview%2Falbum%40243032&statModule=14%3A137&statPage=categorytag%40%E9%9F%B3%E4%B9%90_%E5%85%A8%E9%83%A8&statPosition=1&trackId=17166137";
    NSString *URLStr = [NSString stringWithFormat:@"%@=%lu&%@",URL_MusicList,self.albumId,str];
    [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:URLStr Parameter:nil Success:^(NSDictionary *dic) {
        
        [self.tableView.mj_footer endRefreshing];
        
        self.listBaseModel = [MusicListBaseClass modelObjectWithDictionary:dic];
        
        NSLog(@">>>>>>>>>>>>>>%d",(int)self.listBaseModel.data.tracks.maxPageId);
        _maxPageId =(int)self.listBaseModel.data.tracks.maxPageId;
        for (MusicListList *listModel in self.listBaseModel.data.tracks.list) {
            [self.musicListArray addObject:listModel];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self tableHeaderView];
          
            if (self.pageId < _maxPageId) {
                [self footerRefresh];
            }
           
         
            
        });
    } Fail:^(NSError *error) {
        NSLog(@">>>>%@",error);
    }];
}

//加载更多数据
-(void)dataRequestMore{
    NSString *str = @"pageSize=20&statEvent=pageview%2Falbum%403726515&statModule=&statPage=categorytag%40%E9%9F%B3%E4%B9%90_%E5%85%A8%E9%83%A8&statPosition=2";
    NSString *URLStr = [NSString stringWithFormat:@"%@=%lu&device=iPhone&isAsc=true&pageId=%lu&%@",URL_MusicListMore,self.albumId,self.pageId,str];
        NSLog(@"%@",URLStr);
    if (_pageId <= _maxPageId) {
        [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:URLStr Parameter:nil Success:^(NSDictionary *dic) {
            
            [self.tableView.mj_footer endRefreshing];
            
            NSArray *array = dic[@"data"][@"list"];
            
            
            for (NSDictionary *dic in array) {
                MusicListList *listModel = [MusicListList modelObjectWithDictionary:dic];
                [self.musicListArray addObject:listModel];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
               
                [self footerRefresh];
                
            });
        } Fail:^(NSError *error) {
            NSLog(@">>>>>>%@",error);
        }];
    }
   
}


//下载的数据请求
-(void)dataRequestDownloadWithUid:(int)uid Track:(int)track{
    NSString *URLStr = [NSString stringWithFormat:@"%@/%d/track/%d",URL_DownLoad,uid,track];
   // NSLog(@">>>>>>>>>>>>>>>>>%@",URLStr);
    [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:URLStr Parameter:nil Success:^(NSDictionary *dic) {
      //  NSLog(@">>>>>>>>>%@",dic);
        self.downloadBaseModel = [MusicDownloadBaseClass modelObjectWithDictionary:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            
            SongDownloadManager *manager = [SongDownloadManager defaultManager];
            if (!self.isDownloading) {
                
                [LLShowHUD showHUD:self.view Message:@"正在下载..." AfterDelay:0.5];
                
                DownLoad *download = [manager addDownloadTaskWithURL:self.downloadBaseModel.downloadUrl];
                [download startDownLoad];
                download.downLoadProgressBlock = ^(int progress){
                    NSLog(@">>>>>>>>>>>>>>>>>%d",progress);
                };
                download.downLoadPathBlock = ^(NSString *path){
                    DownloadModel *model = [[DownloadModel alloc] init];
                    model.path = path;
                    model.songName = self.downloadBaseModel.title;
                    model.imageURL = self.downloadBaseModel.albumCoverMiddle;
                    model.songDuration = [NSString stringWithFormat:@"%d",(int)self.downloadBaseModel.duration];
                    model.albumTitle = self.downloadBaseModel.albumTitle;
                    DownloadDBManager *manager = [DownloadDBManager defaultManager];
                    [manager createTable];
                    [manager insertSongWithModel:model];
                    
                    [LLShowHUD showHUD:self.view Message:@"下载完成!" AfterDelay:0];

                    
                };

            }
          
                   });
    } Fail:^(NSError *error) {
        NSLog(@">>>>>%@",error);
    }];
}

-(void)footerRefresh{
      self.pageId++;
        self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            
            [self dataRequestMore];
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
    NSLog(@"______________%lu",self.musicListArray.count);
    return self.musicListArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SongListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"songlistcell" forIndexPath:indexPath];
    
    MusicListList *listModel = self.musicListArray[indexPath.row];
    cell.listModel = listModel;
    cell.downloadBtn.tag = 100+indexPath.row;
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
   
    __weak typeof(cell) weakCell = cell;
    cell.downloadSongBlock = ^(NSInteger tag){
       // SongListTableViewCell *selectCell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:tag-100 inSection:0]];
         MusicListList *selectModel = self.musicListArray[tag-100];
        [self dataRequestDownloadWithUid:(int)selectModel.uid Track:(int)selectModel.trackId];
        [weakCell.downloadBtn setImage:[UIImage imageNamed:@"download"] forState:UIControlStateNormal];
    };
    
   
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [UIView cellAnimationTwo:cell];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SongPlayTableViewController *songPlayVC = [[SongPlayTableViewController alloc] init];
    //songPlayVC.listModel = [[MusicListList alloc] init];
    songPlayVC.musicListArray = [NSMutableArray array];
   // MusicListList *listModel = self.musicListArray[indexPath.row];
   // songPlayVC.listModel = listModel;
    songPlayVC.selectIndex = indexPath.row;
    songPlayVC.musicListArray = self.musicListArray;
    [self.navigationController pushViewController:songPlayVC animated:YES];
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
