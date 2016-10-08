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
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    
    _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn1.frame = CGRectMake(0, 0, 50, 30);
    [_btn1 setTitle:@"详情" forState:UIControlStateNormal];
    [_btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_btn1 addTarget:self action:@selector(readDetail) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_btn1];
    
    _btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn2.frame = CGRectMake(50, 0, 50, 30);
    [_btn2 setTitle:@"评论" forState:UIControlStateNormal];
    [_btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_btn2 addTarget:self action:@selector(readComment) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_btn2];
    self.navigationItem.titleView = view;
    
    [self creatCommentTabView];
    self.tableView.hidden = YES;
    
    [self.bookImg sd_setImageWithURL:[NSURL URLWithString:_imgUrl]];
    if ([_abstract isEqualToString:@""]) {
        _abstract = @"本书很是牛逼,已经不需要什么简介了!!!";
    }
    self.bookAbstract.text = _abstract;
    
}

-(void)readDetail{
    [_btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    self.tableView.hidden = YES;
}



-(void)readComment{
    [_btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    self.tableView.hidden = NO;
    
    
}
-(void)creatCommentTabView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT-64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"ReadCommentTableViewCell" bundle:nil] forCellReuseIdentifier:@"readCommentCell"];
    _tableView.estimatedRowHeight = 100;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:_tableView];
    
    [self requestCommentData];
}

-(void)requestCommentData{
    _page = 1;
    NSString *url = [NSString stringWithFormat:@"%@&product_id=%@&page=%lu",URL_BookComment,_productID,_page];
    NSLog(@"url_____%@",url);
    
    [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:url Parameter:nil Success:^(NSDictionary *dic) {
        
        _base = [ReadCommentBaseClass modelObjectWithDictionary:dic];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    } Fail:^(NSError *error) {
        NSLog(@"请求失败");
    }];
    
}

#pragma mark - tableView Delegate -
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _base.reviewList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ReadCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"readCommentCell" forIndexPath:indexPath];
    
    ReadCommentReviewList *list = _base.reviewList[indexPath.row];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
