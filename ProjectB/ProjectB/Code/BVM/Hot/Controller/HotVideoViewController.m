//
//  HotVideoViewController.m
//  ProjectB
//
//  Created by 芏小川 on 2016/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import "HotVideoViewController.h"
#import "HotVideoTableViewCell.h"

@interface HotVideoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation HotVideoViewController

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
    self.title = @"热门电影";
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _tableView.rowHeight = 100;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerNib:[UINib nibWithNibName:@"HotVideoTableViewCell" bundle:nil] forCellReuseIdentifier:@"hotVideoCell"];
    [self.view addSubview:_tableView];
    
}



#pragma mark - tableView Delegate -
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hotVideoCell" forIndexPath:indexPath];
    
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
