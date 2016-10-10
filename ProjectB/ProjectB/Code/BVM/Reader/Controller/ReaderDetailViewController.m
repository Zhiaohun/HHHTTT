//
//  ReaderDetailViewController.m
//  ProjectB
//
//  Created by long on 16/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import "ReaderDetailViewController.h"
#import <WebKit/WebKit.h>
#import "ReadCommentTableViewCell.h"
#import "ReadCommentDataModels.h"


@interface ReaderDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UIButton *btn1;
@property (nonatomic,strong) UIButton *btn2;

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,assign) NSInteger page;

@property (nonatomic,strong) ReadCommentBaseClass *base;
@property (nonatomic,strong) NSMutableArray *moreCommentDataArr;
@end

@implementation ReaderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initUI];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private Method -
-(void)initUI{
    //self.title = @"图书详情";
    _moreCommentDataArr = [NSMutableArray array];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    
    _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn1.frame = CGRectMake(0, 0, 50, 30);
    [_btn1 setTitle:@"详情" forState:UIControlStateNormal];
    [_btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_btn1 addTarget:self action:@selector(readerDetail) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_btn1];
    
    _btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn2.frame = CGRectMake(50, 0, 50, 30);
    [_btn2 setTitle:@"评论" forState:UIControlStateNormal];
    [_btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_btn2 addTarget:self action:@selector(readerComment) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_btn2];
    self.navigationItem.titleView = view;
    
    [self creatCommentTabView];
    self.tableView.hidden = YES;
    
    [self.bookImg sd_setImageWithURL:[NSURL URLWithString:_imgUrl]];
    if ([_abstract isEqualToString:@""]) {
        _abstract = @"本书很是牛逼,已经不需要什么简介了!!!";
    }
    self.bookAbstract.text = _abstract;
    
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

-(void)readerDetail{
    [_btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    self.tableView.hidden = YES;
}
-(void)readerComment{
    [_btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    self.tableView.hidden = NO;
    
    
}
-(void)creatCommentTabView{
    _page = 1;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT-64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"ReadCommentTableViewCell" bundle:nil] forCellReuseIdentifier:@"readCommentCell"];
    _tableView.estimatedRowHeight = 100;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:_tableView];
    
    [self requestCommentData];
    [self refreshUI];
}

-(void)requestCommentData{
    NSString *url = [NSString stringWithFormat:@"%@&product_id=%@&page=%lu",URL_BookComment,_productID,_page];
    NSLog(@"url_____%@",url);
    
    [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:url Parameter:nil Success:^(NSDictionary *dic) {
        
        _base = [ReadCommentBaseClass modelObjectWithDictionary:dic];
        
        if (_page == 1) {
            //下拉刷新
            [_moreCommentDataArr removeAllObjects];
            [_moreCommentDataArr addObjectsFromArray:_base.reviewList];
        }
        else{
            //上拉加载
            [_moreCommentDataArr addObjectsFromArray:_base.reviewList];
            
        }
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer endRefreshing];
        });
        
    } Fail:^(NSError *error) {
        NSLog(@"请求失败");
    }];
    
}
-(void)refreshUI{
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        _page = 1;
        [self requestCommentData];
    }];
    [self.tableView.mj_header beginRefreshing];
    
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        _page ++;
        [self requestCommentData];
    }];
}

#pragma mark - tableView Delegate -
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _moreCommentDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ReadCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"readCommentCell" forIndexPath:indexPath];
    
    ReadCommentReviewList *list = _moreCommentDataArr[indexPath.row];
    
    cell.username.text = list.custName;
    cell.commentTime.text = list.creationDate;
    cell.commentContent.text = list.body;
    if ([list.custLevelSimple isEqualToString:@"V1"]) {
        cell.scoreStar.image = [UIImage imageNamed:@"一星"];
    }
    else if ([list.custLevelSimple isEqualToString:@"V2"]) {
        cell.scoreStar.image = [UIImage imageNamed:@"二星"];
    }
    else if ([list.custLevelSimple isEqualToString:@"V3"]) {
        cell.scoreStar.image = [UIImage imageNamed:@"三星"];
    }
    else if ([list.custLevelSimple isEqualToString:@"V4"]) {
        cell.scoreStar.image = [UIImage imageNamed:@"四星"];
    }
    else {
        cell.scoreStar.image = [UIImage imageNamed:@"五星"];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
