//
//  SongPlayTableViewController.m
//  ProjectB
//
//  Created by long on 2016/10/8.
//  Copyright © 2016年 long. All rights reserved.
//

#import "SongPlayTableViewController.h"
#import "MusicPlayHeaderView.h"
#import "CommentModel.h"
#import "SongPlayCommentTableViewCell.h"
#import "SongPlayManager.h"
#import "UIImageView+imageViewAnimation.h"
#import "SongCommentsTableViewController.h"

@interface SongPlayTableViewController ()
@property (nonatomic, strong) MusicPlayHeaderView *headerView;
@property (nonatomic, strong) NSMutableArray *commentArray;
@property (nonatomic, assign) BOOL isPlay;
@property (nonatomic, strong) MusicListList *listModel;
@property (nonatomic, strong) NSMutableArray  *contentArray;



@end

@implementation SongPlayTableViewController

-(NSMutableArray *)commentArray{
    if (!_commentArray) {
        _commentArray = [NSMutableArray array];
    }
    return _commentArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _listModel = self.musicListArray[_selectIndex];
    //改变标题
    self.title = self.listModel.title;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
   // NSLog(@"_+_+_+%@",self.listModel);
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;

    [self dataRequest];
    UINib *commentNib = [UINib nibWithNibName:@"SongPlayCommentTableViewCell" bundle:nil];
    [self.tableView registerNib:commentNib forCellReuseIdentifier:@"commentcell"];
    
    [self loadData];


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

//音乐首次播放
-(void)loadData{
    
    SongPlayManager *manager = [SongPlayManager defaultManager];

    manager.songArray = self.musicListArray;
    manager.index = self.selectIndex;
    NSLog(@">>>>>%@",manager.songArray);
    
    [manager playSong];
    self.isPlay = YES;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(loadSlider) userInfo:nil repeats:YES];
}

-(void)dataRequest{
    self.listModel = self.musicListArray[_selectIndex];
    self.commentArray = nil;
    
    NSString *URLStr = [NSString stringWithFormat:@"%@/%d?albumId=%d&device=iPhone&trackUid=%d",URL_Play,(int)self.listModel.trackId,(int)self.listModel.albumId,(int)self.listModel.uid];
   // NSLog(@"_+_______%@",URLStr);
    
    [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:URLStr Parameter:nil Success:^(NSDictionary *dic) {
       // NSLog(@"+++++++++%@",dic);
        NSArray *array = dic[@"commentInfo"][@"list"];
        for (NSDictionary *dic in array) {
            CommentModel *model = [[CommentModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.commentArray addObject:model];
            
            
        }
      
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self tableViewHeaderView];
            [self tableViewFooterView];
            
        });
    } Fail:^(NSError *error) {
        NSLog(@">>>>>>%@",error);
    }];
}

-(void)tableViewHeaderView{
    _headerView = [[NSBundle mainBundle] loadNibNamed:@"MusicPlayHeaderView" owner:nil options:nil][0];
    _headerView.frame = CGRectMake(0, 0, VIEW_WIDTH, 460);
    self.tableView.tableHeaderView = _headerView;
    
   // MusicListList *listModel = self.musicListArray[self.selectIndex];
   

    
    [_headerView.musicPlayImageView sd_setImageWithURL:[NSURL URLWithString:self.listModel.coverLarge] placeholderImage:PlaceholderImage];

    [_headerView.musicPlayImageView backgroundImageAnimation];
    
    _headerView.durationLabel.text = [NSString stringWithFormat:@"%02d:%02d",(int)self.listModel.duration/60,(int)self.listModel.duration%60];
    _headerView.musicPlayTitleLabel.text = self.listModel.title;
    _headerView.musicPlayPlayTimesLabel.text = [NSString stringWithFormat:@"%d次播放",(int)self.listModel.playtimes];
    
    NSString *timeStr = [self timeWithTimeIntervalString:[NSString stringWithFormat:@"%f",self.listModel.createdAt]];
    _headerView.musicPlayCreatedTimeLabel.text = timeStr;


    SongPlayManager *manager = [SongPlayManager defaultManager];
    //音乐的播放与暂停
    __weak typeof(self) weakSelf = self;
    _headerView.songPlayBlock = ^{
        if (self.isPlay == YES) {
            [manager pauseSong];
            [weakSelf.headerView.playBtn setImage:[UIImage imageNamed:@"player_btn_play_highlight"] forState:UIControlStateNormal];
            weakSelf.isPlay = NO;
        }else{
            [manager playSong];
            [weakSelf.headerView.playBtn setImage:[UIImage imageNamed:@"player_btn_pause_highlight"] forState:UIControlStateNormal];
            weakSelf.isPlay = YES;
        }
    };
    
    //下一首
    _headerView.songNextBlock = ^{
        weakSelf.selectIndex += 1;
        weakSelf.selectIndex = weakSelf.selectIndex % weakSelf.musicListArray.count;
        manager.index = weakSelf.selectIndex;
        _listModel = self.musicListArray[_selectIndex];
        //改变标题
        weakSelf.title = weakSelf.listModel.title;

        [weakSelf dataRequest];
        [manager nextSong];
    };
    
    _headerView.songLastBlock = ^{
        weakSelf.selectIndex--;
        if (weakSelf.selectIndex < 0) {
            weakSelf.selectIndex = weakSelf.musicListArray.count - 1;
        }
        manager.index = weakSelf.selectIndex;
        _listModel = self.musicListArray[_selectIndex];
        //改变标题
        weakSelf.title = weakSelf.listModel.title;
        [weakSelf dataRequest];
        [manager lastSong];
    };

    
    _headerView.seekToTimeBlock = ^{
      manager.currentTime = _headerView.slider.value * manager.totalTime;
        [manager seekToTime:weakSelf.headerView.slider.value];
    };
}


-(void)tableViewFooterView{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, VIEW_WIDTH, 30);
    [self.view addSubview:btn];
    [btn setBackgroundColor:[UIColor cyanColor]];
    [btn setTitle:@"点击查看更多评论" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(tapBtnAction) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableFooterView = btn;
}
-(void)loadSlider{
    //NSLog(@">>>");
    SongPlayManager *manager = [SongPlayManager defaultManager];
    _headerView.slider.maximumValue = manager.totalTime;
    _headerView.slider.value = manager.currentTime;
    
}

-(void)tapBtnAction{
    SongCommentsTableViewController *songCommentVC = [[SongCommentsTableViewController alloc] init];
    MusicListList *model = self.musicListArray[_selectIndex];
    songCommentVC.trackId = (int)model.trackId;
    
    [self.navigationController pushViewController:songCommentVC animated:YES];
}
//时间戳转化为时间NSDate
- (NSString *)timeWithTimeIntervalString:(NSString *)timeString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
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
    return self.commentArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SongPlayCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentcell" forIndexPath:indexPath];
    

    CommentModel *model = self.commentArray[indexPath.row];
    cell.model = model;
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    return cell;
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
