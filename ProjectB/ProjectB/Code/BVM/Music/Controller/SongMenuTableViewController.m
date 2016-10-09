//
//  SongMenuTableViewController.m
//  ProjectB
//
//  Created by long on 16/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import "SongMenuTableViewController.h"
#import "SongMenuTableViewCell.h"
#import "SongListTableViewController.h"
#import "MusicCategoryDataModels.h"

@interface SongMenuTableViewController ()
@property (nonatomic, assign) NSInteger pageId;
@property (nonatomic, strong) NSMutableArray *musicCategoryArray;
@property (nonatomic, strong) MusicCategoryBaseClass *categoryBaseModel;

@end

@implementation SongMenuTableViewController

//音乐分类数组懒加载
-(NSMutableArray *)musicCategoryArray{
    if (!_musicCategoryArray) {
        _musicCategoryArray = [NSMutableArray array];
    }
    return _musicCategoryArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;

   
    self.pageId = 1;
    [self headerRefresh];
    
    UINib *songMenuNib = [UINib nibWithNibName:@"SongMenuTableViewCell" bundle:nil];
    [self.tableView registerNib:songMenuNib forCellReuseIdentifier:@"songmenucell"];
}


//网络请求
-(void)dataRequest{
    NSString *URLStr = [NSString stringWithFormat:@"%@=%lu&pageSize=20&status=0&version=5.4.33",URL_MusicCategory,self.pageId];
    NSLog(@"%@",URLStr);
    
    [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:URLStr Parameter:nil Success:^(NSDictionary *dic) {
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
        self.categoryBaseModel = [MusicCategoryBaseClass modelObjectWithDictionary:dic];
        for (MusicCategoryList *listModel in self.categoryBaseModel.list) {
            if (!listModel.displayPrice) {
                [self.musicCategoryArray addObject:listModel];
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

-(void)headerRefresh{
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self dataRequest];
    }];
    [self.tableView.mj_header beginRefreshing];
    
    
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
    return self.musicCategoryArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SongMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"songmenucell" forIndexPath:indexPath];
    MusicCategoryList *listModel = self.musicCategoryArray[indexPath.row];
    cell.listModel = listModel;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SongListTableViewController *songListVC = [[SongListTableViewController alloc] init];
    MusicCategoryList *model = self.musicCategoryArray[indexPath.row];
    songListVC.albumId = model.albumId;
    [self.navigationController pushViewController:songListVC animated:YES];
    
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
