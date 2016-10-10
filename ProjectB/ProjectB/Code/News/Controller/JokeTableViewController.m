//
//  JokeTableViewController.m
//  ProjectB
//
//  Created by long on 2016/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import "JokeTableViewController.h"
#import "NewsJokeTableViewCell.h"
#import "NewsJokeDataModels.h"

@interface JokeTableViewController ()
@property (nonatomic, assign) NSInteger offset;
@property (nonatomic, strong) NewsJokeBaseClass *jokeBaseModel;
@property (nonatomic, strong) NSMutableArray *jokeArray;

@end

@implementation JokeTableViewController

-(NSMutableArray *)jokeArray{
    if (!_jokeArray) {
        _jokeArray = [NSMutableArray array];
    }
    return _jokeArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.offset = 0;
    [self headerRefresh];
    
    UINib *jokeNib = [UINib nibWithNibName:@"NewsJokeTableViewCell" bundle:nil];
    [self.tableView registerNib:jokeNib forCellReuseIdentifier:@"jokecell"];
}

-(void)dataRequest{
    NSString *str = @"size=20&spever=false&net=wifi&lat=&lon=&ts=1475758453&sign=F%2Budf9G%2FjoIsCyTRiS7QYYPJoiSkQa%2FaZ2VAgVdej2B48ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore";
    
    
    NSString *str1 = @"http://119.29.47.97/article/list/suggest?count=30&readarticles=%5B117705097%2C117710114%2C117705669%2C117704838%5D&page=1&AdID=1476010505874651D9267D";
    NSString *URLStr = [NSString stringWithFormat:@"%@=%lu&%@",URL_Joke,self.offset,str];
    
    [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:str1 Parameter:nil Success:^(NSDictionary *dic) {
        
        NSLog(@"_+_+_+_+_+_+_+_+__+_+_+_%@",dic);
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
        self.jokeBaseModel = [NewsJokeBaseClass modelObjectWithDictionary:dic];
        for (NewsJokeInternalBaseClass1 *model in self.jokeBaseModel.myProperty1) {
            [self.jokeArray addObject:model];
        }
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
    self.offset += 1;
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
    return self.jokeArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsJokeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jokecell" forIndexPath:indexPath];
    NewsJokeInternalBaseClass1 *model = self.jokeArray[indexPath.row];
    cell.model = model;
    
    
    __weak typeof(cell) weakCell = cell;
    cell.upBtnBlock = ^{
        [weakCell.upBtn setImage:[UIImage imageNamed:@"duanzi_up_selected"] forState:UIControlStateSelected];
        [weakCell.upBtn setTitleColor:[JudgeManager defaultManager].originColor forState:UIControlStateSelected];
        [weakCell.upBtn setTitle:[NSString stringWithFormat:@"%d",(int)model.upTimes + 1] forState:UIControlStateSelected];
    };
    
    cell.downBtnBlock = ^{
        [weakCell.downBtn setImage:[UIImage imageNamed:@"duanzi_down_selected"] forState:UIControlStateSelected];
        [weakCell.downBtn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        [weakCell.downBtn setTitle:[NSString stringWithFormat:@"%d",(int)model.downTimes + 1] forState:UIControlStateSelected];
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
