//
//  ReadRankingListTableViewController.m
//  ProjectB
//
//  Created by long on 2016/9/29.
//  Copyright © 2016年 long. All rights reserved.
//

#import "ReadRankingListTableViewController.h"
#import "ReaderRankListTableViewCell.h"
#import "ReadRankList DataModels.h"
#import "ReaderDetailViewController.h"

@interface ReadRankingListTableViewController ()

@property (nonatomic,assign) NSInteger page;

@property (nonatomic,strong) ReadRankListBaseClass *base;
@property (nonatomic,strong) NSMutableArray *moreDataArr;
@property (nonatomic, strong) SwiftHUD *swiftHUD;
@end

@implementation ReadRankingListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    _swiftHUD = [SwiftHUD new];
    [_swiftHUD startLoadHUD];
    [self requestData];
    [self refreshUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - private Method -
-(void)initUI{
    _page = 1;
    _moreDataArr = [NSMutableArray array];
    [self.tableView registerNib:[UINib nibWithNibName:@"ReaderRankListTableViewCell" bundle:nil] forCellReuseIdentifier:@"ReaderRankListCell"];
    self.tableView.rowHeight = 178;
    self.tableView.backgroundColor = [JudgeManager defaultManager].originColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

-(void)refreshUI{
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        _page = 1;
        [self requestData];
    }];
    //[self.tableView.mj_header beginRefreshing];
    
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        _page ++;
        [self requestData];
    }];
}


-(void)requestData{
    
    NSString *rankUrl = [NSString stringWithFormat:@"%@&page=%lu",URL_RankListRead,_page];
    
    [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:rankUrl Parameter:nil Success:^(NSDictionary *dic) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.swiftHUD stopLoadHUD];
        });
        _base = [ReadRankListBaseClass modelObjectWithDictionary:dic];
        
        if (_page == 1) {
            //下拉刷新
            [_moreDataArr removeAllObjects];
            [_moreDataArr addObjectsFromArray:_base.products];
        }
        else{
            //上拉加载
            [_moreDataArr addObjectsFromArray:_base.products];
            
        }

        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer endRefreshing];
        });
        
    } Fail:^(NSError *error) {
        NSLog(@"请求排行榜失败");
    }];
    
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _moreDataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReaderRankListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReaderRankListCell" forIndexPath:indexPath];
    
    ReadRankListProducts *products = _moreDataArr[indexPath.row];
    cell.rankLb.text = [NSString stringWithFormat:@"%.0f",products.rank];
    cell.bookName.text = products.productName;
    cell.bookWriter.text = [NSString stringWithFormat:@"作者: %@",products.author];
    cell.bookPrint.text = [NSString stringWithFormat:@"出版社: %@",products.publisher];
    [cell.bookImg sd_setImageWithURL:[NSURL URLWithString:products.imgUrl]];
    cell.bookComment.text = [NSString stringWithFormat:@"%@条评论",products.reviewTotal];
    cell.bookIntroduce.text = products.abstract;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ReaderDetailViewController *readerDetailVC = [ReaderDetailViewController new];
    ReadRankListProducts *products = _base.products[indexPath.row];
    readerDetailVC.productID = products.productId;
    readerDetailVC.imgUrl = products.imgUrl;
    readerDetailVC.abstract = products.abstract;
    [self.navigationController pushViewController:readerDetailVC animated:YES];
    //[self.navigationController wxs_pushViewController:readerDetailVC animationType:WXSTransitionAnimationTypeSysPageCurlFromBottom];
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
