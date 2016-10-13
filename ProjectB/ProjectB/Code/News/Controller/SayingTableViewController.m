//
//  SayingTableViewController.m
//  ProjectB
//
//  Created by long on 2016/10/10.
//  Copyright © 2016年 long. All rights reserved.
//

#import "SayingTableViewController.h"
#import "NewsSayingModel.h"
#import "SayingTableViewCell.h"
#import "UIImageView+imageViewAnimation.h"

@interface SayingTableViewController ()

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSMutableArray *newsSayingArray;
@property (nonatomic, assign) NSInteger maxBehotTime;
@end

@implementation SayingTableViewController
-(NSMutableArray *)newsSayingArray{
    if (!_newsSayingArray) {
        _newsSayingArray = [NSMutableArray array];
    }
    return _newsSayingArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    self.maxBehotTime = (int)[date timeIntervalSince1970];
    [self headerRefresh];
    
    UINib *sayingNib = [UINib nibWithNibName:@"SayingTableViewCell" bundle:nil];
    [self.tableView registerNib:sayingNib forCellReuseIdentifier:@"sayingcell"];
    
}


-(void)dataRequest{
    NSString *str = @"ac=wifi&channel=App%20Store&app_name=criticism_essay&version_code=2.4.1&device_platform=iphone&os_version=8.3&device_type=Unknown%20iPhone&vid=58F1D3DF-BA17-44EC-A91D-672F594EE1B0&openudid=00a575f72ecf898c2896f3bae7bf817bcba0f105&idfa=51D9267D-D8DA-4E03-BFE8-74268A090173";
    NSString *URLStr = [NSString stringWithFormat:@"%@=%lu&%@",URL_Saying,self.maxBehotTime,str];
    [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:URLStr Parameter:nil Success:^(NSDictionary *dic) {
        //  NSLog(@">>>>>>>%@",dic);
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
        NSLog(@">>>>>>>>>>>>>>>>>>>>>>%@",dic[@"data"]);
        NSArray *array = dic[@"data"];
        for (NSDictionary *dic in array) {
            NewsSayingModel *model = [[NewsSayingModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.newsSayingArray addObject:model];
            NSLog(@"_+_+_+_+_+_+_+_+%@",model);
        }
        NSLog(@"<<<<<<<<<<<%lu",self.newsSayingArray.count);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self footerRefresh];
        });
    } Fail:^(NSError *error) {
        NSLog(@">>>>%@",error);
    }];
}

-(void)headerRefresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self dataRequest];
    }];
    [self.tableView.mj_header beginRefreshing];
}

-(void)footerRefresh{
    self.maxBehotTime = (int)[[self.newsSayingArray lastObject] behot_time];
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
    return self.newsSayingArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    SayingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sayingcell" forIndexPath:indexPath];
    
    
    NewsSayingModel *model = self.newsSayingArray[indexPath.row];
    cell.model = model;
  
    //给cell加上一层阴影,实现浮动效果
    cell.cellView.backgroundColor = [UIColor whiteColor];
    //给cellView边框设置阴影
    cell.cellView.layer.shadowOffset = CGSizeMake(1,1);
    cell.cellView.layer.shadowOpacity = 0.3;
    cell.cellView.layer.shadowColor = [UIColor blackColor].CGColor;
  
    __weak typeof(cell) weakCell = cell;
    cell.upBtnActionBlock = ^{
        [weakCell.upBtn setImage:[UIImage imageNamed:@"duanzi_up_selected"] forState:UIControlStateNormal];
        [weakCell.upBtn.imageView spotAnimation];
        [weakCell.upBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [weakCell.upBtn setTitle:[NSString stringWithFormat:@"%d",(int)model.digg_count + 1] forState:UIControlStateNormal];
        };
    
    cell.downBtnActionBlock = ^{
        [weakCell.downBtn setImage:[UIImage imageNamed:@"duanzi_down_selected"] forState:UIControlStateNormal];
        [weakCell.downBtn.imageView spotAnimation];
        [weakCell.downBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [weakCell.downBtn setTitle:[NSString stringWithFormat:@"%d",(int)model.bury_count + 1] forState:UIControlStateNormal];
    };
    
    
    cell.shareBtnActionBlock = ^{
        [Share shareToWeiBo:@[model.profile_image_url] Content:model.content URLStr:nil Title:nil];
    };
    
    
    
    
    
    
    
    
    
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
