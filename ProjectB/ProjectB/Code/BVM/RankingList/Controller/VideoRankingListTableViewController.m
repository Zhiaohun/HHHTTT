//
//  VideoRankingListTableViewController.m
//  ProjectB
//
//  Created by long on 2016/9/29.
//  Copyright © 2016年 long. All rights reserved.
//

#import "VideoRankingListTableViewController.h"
#import "HotVideoTableViewCell.h"
#import "VideoListDataModels.h"
#import "MoviePlayerViewController.h"
#import "VideoFullScreenViewController.h"

@interface VideoRankingListTableViewController ()
@property (nonatomic, strong) VideoListBaseClass *videoBaseModel;

@end

@implementation VideoRankingListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
     [self.tableView registerNib:[UINib nibWithNibName:@"HotVideoTableViewCell" bundle:nil] forCellReuseIdentifier:@"videocell"];
    [self requestMovieData];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoBaseModel.itemList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HotVideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"videocell" forIndexPath:indexPath];
    VideoListItemList *model = self.videoBaseModel.itemList[indexPath.row];
    [cell.VideoImageView sd_setImageWithURL:[NSURL URLWithString:model.data.cover.feed] placeholderImage:PlaceholderImage];
    cell.videoTitle.text = model.data.title;
    
    cell.rankLb.hidden = NO;
    cell.rankLb.text = [NSString stringWithFormat:@"%lu",indexPath.row+1];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.transform = CGAffineTransformTranslate(cell.transform, -[UIScreen mainScreen].bounds.size.width/2, 0);
    [UIView animateWithDuration:0.5 animations:^{
        cell.transform = CGAffineTransformIdentity;
    }];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    VideoFullScreenViewController *moviePlayVC = [[VideoFullScreenViewController alloc] init];
    moviePlayVC.dataArray = [NSArray array];
    moviePlayVC.dataArray = self.videoBaseModel.itemList;
    moviePlayVC.selectIndex = indexPath.row;
    // [self.navigationController pushViewController:moviePlayVC animated:YES];
    [self presentViewController:moviePlayVC animated:YES completion:nil];
    
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
