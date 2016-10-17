//
//  VideoListTableViewController.m
//  ProjectB
//
//  Created by long on 2016/9/29.
//  Copyright © 2016年 long. All rights reserved.
//

#import "VideoListTableViewController.h"
#import "VideoListTableViewCell.h"
#import "VideoListHeaderView.h"
#import "VideoListDataModels.h"
#import "VideoDetailViewController.h"


@interface VideoListTableViewController ()
@property (nonatomic, strong) NSString *strategyType;
@property (nonatomic, assign) NSInteger startCount;
@property (nonatomic, assign) NSInteger categoryId;
@property (nonatomic, strong) VideoListBaseClass *baseModel;
@property (nonatomic, strong) NSMutableArray *dateArray;
@property (nonatomic, strong) NSMutableArray *shareArray;


@end

@implementation VideoListTableViewController

-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
  
    self.title = [self.listModel.data.title substringFromIndex:1];
 
    UINib *videoListNib = [UINib nibWithNibName:@"VideoListTableViewCell" bundle:nil];
    [self.tableView registerNib:videoListNib forCellReuseIdentifier:@"videolistcell"];
    
    self.startCount = 0;
    self.strategyType = @"date";

    [self headerRefresh];
    [self goback];
    [self headerView];
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

-(void)headerView{
    VideoListHeaderView *headerView = [[NSBundle mainBundle] loadNibNamed:@"VideoListHeaderView" owner:nil options:nil][0];
    headerView.frame = CGRectMake(0, 0, VIEW_WIDTH, 40);
    //[headerView insertSubview:headerView.backgroundView atIndex:0];
    headerView.rightBtnView1.hidden = YES;
    headerView.rightBtnView2.hidden = YES;
    headerView.leftBtnView1.hidden = NO;
    headerView.leftBtnView2.hidden = NO;
    self.tableView.tableHeaderView = headerView;
   
    headerView.dateBtnBlock = ^{

        self.startCount = 0;
        self.strategyType = @"date";
        [self headerRefresh];
    };
    
    
    headerView.shareBtnBlock = ^{
        
        self.startCount = 0;
        self.strategyType = @"shareCount";
        [self headerRefresh];
    };
    
}

#pragma mark - 网络请求
-(void)dataRequest{
    NSString *url = [[NSString alloc] init];
    if (!IsEmptyString(self.listModel.data.title)) {
        url = [NSString stringWithFormat:@"%@?start=%lu&num=20&categoryId=%d&strategy=%@",URL_NORMAL,self.startCount,(int)self.listModel.data.dataIdentifier,self.strategyType];
    }
//    else{
//        url = [NSString stringWithFormat:@"%@?start=%lu&num=20&tagId=658&strategy=%@",URL_360,self.startCount,self.strategyType];
//        
//    }
    NSLog(@">>>>%@",url);
    
    [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:url Parameter:nil Success:^(NSDictionary *dic) {
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
        self.baseModel = [VideoListBaseClass modelObjectWithDictionary:dic];
        
        if ([self.strategyType isEqualToString:@"date"]) {
            for (VideoListItemList *model in self.baseModel.itemList) {
                [self.dateArray addObject:model];
            }
        }else{
            for (VideoListItemList *model in self.baseModel.itemList) {
                [self.shareArray addObject:model];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self footerRefresh];
            
        });
        
    } Fail:^(NSError *error) {
        NSLog(@">>>>>%@",error);
    }];
}


#pragma mark - 初始化数组
-(NSMutableArray *)dateArray{
    if (!_dateArray) {
        _dateArray = [NSMutableArray array];
    }
    return _dateArray;
}

-(NSMutableArray *)shareArray{
    if (!_shareArray) {
        _shareArray = [NSMutableArray array];
    }
    return _shareArray;
}



//刷新
-(void)headerRefresh{
    self.tableView.mj_header = [MJRefreshNormalHeader  headerWithRefreshingBlock:^{
        [self dataRequest];
    }];
    [self.tableView.mj_header beginRefreshing];
}

//加载更多
-(void)footerRefresh{
    self.startCount += 20;
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
    if ([self.strategyType isEqualToString:@"date"]) {
        return self.dateArray.count;
    }else{
        return self.shareArray.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   VideoListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"videolistcell" forIndexPath:indexPath];
    if ([self.strategyType isEqualToString:@"date"]) {
        VideoListItemList *listModel = self.dateArray[indexPath.row];
        cell.listModel = listModel;
    }else{
        VideoListItemList *listModel = self.shareArray[indexPath.row];
        cell.listModel = listModel;
    }
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.transform = CGAffineTransformTranslate(cell.transform, -[UIScreen mainScreen].bounds.size.width/2, 0);
    [UIView animateWithDuration:0.5 animations:^{
        cell.transform = CGAffineTransformIdentity;
    }];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     VideoDetailViewController *videoDetailVC = [[VideoDetailViewController alloc] init];
    videoDetailVC.dataArray = [NSArray array];
    if ([self.strategyType isEqualToString:@"date"]) {
        videoDetailVC.dataArray = self.dateArray;
        videoDetailVC.selectIndex = indexPath.row;
    }else{
        videoDetailVC.dataArray = self.shareArray;
        videoDetailVC.selectIndex = indexPath.row;
    }
    
    [self.navigationController pushViewController:videoDetailVC animated:YES];
    //[self.navigationController wxs_pushViewController:videoDetailVC animationType:WXSTransitionAnimationTypeBrickOpenVertical];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
    
    
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
