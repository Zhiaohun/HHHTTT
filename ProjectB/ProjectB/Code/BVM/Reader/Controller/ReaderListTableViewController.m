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

@property (nonatomic,strong) NSMutableArray *moreDataArr;

@end

@implementation ReaderListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self requestData];
    [self refreshUI];
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
    
    [self goback];
    _page = 1;
    _moreDataArr = [NSMutableArray array];
    JudgeManager *manager = [JudgeManager defaultManager];
    self.navigationItem.titleView = [manager setFont:@"图书列表"];
    //    self.automaticallyAdjustsScrollViewInsets = NO;
    //    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableView.rowHeight = 120;
    [self.tableView registerNib:[UINib nibWithNibName:@"ReaderListTableViewCell" bundle:nil] forCellReuseIdentifier:@"readerListCell"];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self viewDidLayoutSubviews];
    
    _readerView = [[NSBundle mainBundle]loadNibNamed:@"ReaderListHeaderView" owner:nil options:nil][0];
    
    _readerView.frame = CGRectMake(0, 0, VIEW_WIDTH, 97);
    self.tableView.tableHeaderView = _readerView;
    
    //self.tableView.tableHeaderView.frame = CGRectMake(0, 0, VIEW_WIDTH, 97-64);
    
//    if ([UIScreen mainScreen].bounds.size.width == 375) {
//        self.tableView.tableHeaderView.frame = CGRectMake(0, 0, VIEW_WIDTH, 97-64);
//    }
//    else if ([UIScreen mainScreen].bounds.size.width == 414){
//        self.tableView.tableHeaderView.frame = CGRectMake(0, 0, VIEW_WIDTH, 97-64-64);
//    }
//    else{
//        self.tableView.tableHeaderView.frame = CGRectMake(0, 0, VIEW_WIDTH, 97);
//    }
    
    
    [_readerView.movition setTitleColor:[JudgeManager defaultManager].originColor forState:UIControlStateNormal];
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

-(void)viewDidLayoutSubviews
{
    self.tableView.tableHeaderView.frame = CGRectMake(0, 0, VIEW_WIDTH, 97);

}
-(void)refreshUI{
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        _page = 1;
        [self requestData];
    }];
    [self.tableView.mj_header beginRefreshing];
    
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        _page ++;
        [self requestData];
    }];
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

-(void)requestData{
   // NSDictionary *dic = @{@"page":@"1"};
    NSString *dataUrl = [NSString stringWithFormat:@"%@&page=%lu",_url,_page];
    [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:dataUrl Parameter:nil Success:^(NSDictionary *dic) {
        _base = [ReadMotivationBaseClass modelObjectWithDictionary:dic];
        
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
        NSLog(@"失败");
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
    
    ReadMotivationProducts *products = _moreDataArr[indexPath.row];
    
    ReaderListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"readerListCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.BookName.text = products.name;
    cell.BookWriter.text = products.authorname;
    cell.BookScore.text = [NSString stringWithFormat:@"%@%%",products.highCommonRate];
    [cell.BookImg sd_setImageWithURL:[NSURL URLWithString:products.imageUrl]];
    
    //给cell加上一层阴影,实现浮动效果
    cell.cellView.backgroundColor = [UIColor whiteColor];
    //给cellView边框设置阴影
    cell.cellView.layer.shadowOffset = CGSizeMake(1,1);
    cell.cellView.layer.shadowOpacity = 0.3;
    cell.cellView.layer.shadowColor = [UIColor blackColor].CGColor;
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ReaderDetailViewController *readDetailVC = [ReaderDetailViewController new];
    ReadMotivationProducts *products = _moreDataArr[indexPath.row];
    readDetailVC.productID = products.productsIdentifier;
    readDetailVC.abstract = products.subname;
    readDetailVC.imgUrl = products.imageUrl;
//    [self.navigationController wxs_pushViewController:readDetailVC animationType:WXSTransitionAnimationTypeSysPageCurlFromBottom];
    [self.navigationController pushViewController:readDetailVC animated:YES];

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
