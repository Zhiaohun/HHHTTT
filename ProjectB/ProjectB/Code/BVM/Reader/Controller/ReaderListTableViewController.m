//
//  ReaderListTableViewController.m
//  ProjectB
//
//  Created by long on 16/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import "ReaderListTableViewController.h"
#import "ReaderListTableViewCell.h"
#import "ReaderListHeaderView.h"
#import "ReadMotivation DataModels.h"
#import "ReaderDetailViewController.h"

@interface ReaderListTableViewController ()
@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) ReadMotivationBaseClass *base;
@property (nonatomic,strong) ReaderListHeaderView *readerView;
@property (nonatomic,assign) NSInteger page;
@end

@implementation ReaderListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self requestData];
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - private Method -
-(void)initUI{
    self.title = @"图书列表";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.rowHeight = 120;
    [self.tableView registerNib:[UINib nibWithNibName:@"ReaderListTableViewCell" bundle:nil] forCellReuseIdentifier:@"readerListCell"];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    _readerView = [[NSBundle mainBundle]loadNibNamed:@"ReaderListHeaderView" owner:nil options:nil][0];
    self.tableView.tableHeaderView = _readerView;
    self.tableView.tableHeaderView.frame = CGRectMake(0, 0, VIEW_WIDTH, 161-64);
    [_readerView.movition setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _url = URL_MovitionBook;
    
    __weak typeof (self)weakSelf = self;
    _readerView.toTypeBlock = ^(NSString *txt){
        if ([txt isEqualToString:@"励志"]) {
            _url = URL_MovitionBook;
            [weakSelf requestData];
        }
        else if ([txt isEqualToString:@"心理学"]){
            _url = URL_PsychologyBook;
            [weakSelf requestData];
        }
        else if ([txt isEqualToString:@"小说"]){
            _url = URL_NovelBook;
            [weakSelf requestData];
        }
        else{
            _url = URL_ArtBook;
            [weakSelf requestData];
        }
    } ;
}

-(void)requestData{
   // NSDictionary *dic = @{@"page":@"1"};
    NSString *dataUrl = [NSString stringWithFormat:@"%@&page=1",_url];
    [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:dataUrl Parameter:nil Success:^(NSDictionary *dic) {
        _base = [ReadMotivationBaseClass modelObjectWithDictionary:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } Fail:^(NSError *error) {
        NSLog(@"失败");
    }];
}

-(void)requestMoreData{
    NSString *dataUrl = [NSString stringWithFormat:@"%@&page=%lu",_url,_page];
    [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:dataUrl Parameter:nil Success:^(NSDictionary *dic) {
        _base = [ReadMotivationBaseClass modelObjectWithDictionary:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } Fail:^(NSError *error) {
        NSLog(@"失败");
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.base.products.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ReadMotivationProducts *products = _base.products[indexPath.row];
    
   // NSLog(@"_base++++%@",_base);
    NSLog(@"products+++%@",products.name);
    
    
    ReaderListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"readerListCell" forIndexPath:indexPath];
    cell.BookName.text = products.name;
    cell.BookWriter.text = products.authorname;
    cell.BookScore.text = [NSString stringWithFormat:@"%@%%",products.highCommonRate];
    [cell.BookImg sd_setImageWithURL:[NSURL URLWithString:products.imageUrl]];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ReaderDetailViewController *readDetailVC = [ReaderDetailViewController new];
    ReadMotivationProducts *products = _base.products[indexPath.row];
    readDetailVC.productID = products.productsIdentifier;
    readDetailVC.abstract = products.subname;
    readDetailVC.imgUrl = products.imageUrl;
    [self.navigationController pushViewController:readDetailVC animated:YES];

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
