//
//  GameTableViewController.m
//  ProjectB
//
//  Created by long on 2016/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import "GameTableViewController.h"
#import "NewsImageTableViewCell.h"
#import "NewsImageMoreTableViewCell.h"
#import "NewsTableViewCell.h"
#import "NewsWebViewController.h"
#import "NewsImageViewController.h"
#import "NewsScrollViewTableViewCell.h"
#import "NewsGameDataModels.h"


#import "KNBannerView.h"
#import "NSData+KNCache.h"
@interface GameTableViewController ()<KNBannerViewDelegate>
@property (nonatomic, assign) NSInteger countStart;
@property (nonatomic, strong) NewsGameBaseClass *gameBaseModel;
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) NSMutableArray *imgArray;
@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, strong) KNBannerView *bannerView;
@end

@implementation GameTableViewController
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.countStart = 0;
    [self headerRefresh];
    [self cellResigest];
    
    
    
}
-(void)dataRequest{
    NSString *URLStr = [NSString stringWithFormat:@"%@/%lu-20.html",URL_Game,self.countStart];
    
    
    
    [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:URLStr Parameter:nil Success:^(NSDictionary *dic) {
       // NSLog(@"++++++++++++++%@",dic);
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
        self.gameBaseModel = [NewsGameBaseClass modelObjectWithDictionary:dic];
        _imgArray = [NSMutableArray array];
        _titleArray = [NSMutableArray array];
        
        
        NewsGameT1348654151579 *model = self.gameBaseModel.t1348654151579[0];
        [_imgArray addObject:model.imgsrc];
        [_titleArray addObject:model.title];
        
        for (NewsGameT1348654151579 *model in self.gameBaseModel.t1348654151579) {
            [self.dataArray addObject:model];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self footerRefresh];
        });
    } Fail:^(NSError *error) {
        NSLog(@">>>%@",error);
    }];
}

-(void)cellResigest{
    UINib *newsCellNib = [UINib nibWithNibName:@"NewsTableViewCell" bundle:nil];
    [self.tableView registerNib:newsCellNib forCellReuseIdentifier:@"newscell"];
    
    UINib *newsImageCellNib = [UINib nibWithNibName:@"NewsImageTableViewCell" bundle:nil];
    [self.tableView registerNib:newsImageCellNib forCellReuseIdentifier:@"newsimagecell"];
    
    UINib *newsImageMoewCellNib = [UINib nibWithNibName:@"NewsImageMoreTableViewCell" bundle:nil];
    [self.tableView registerNib:newsImageMoewCellNib forCellReuseIdentifier:@"newsimagemorecell"];
    
    UINib *newsScrollViewCellNib = [UINib nibWithNibName:@"NewsScrollViewTableViewCell" bundle:nil];
    [self.tableView registerNib:newsScrollViewCellNib forCellReuseIdentifier:@"newsscrollcell"];

    
}

-(void)headerRefresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self dataRequest];
    }];
    [self.tableView.mj_header beginRefreshing];
}

-(void)footerRefresh{
    self.countStart += 20;
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
    return self.dataArray.count-1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NewsGameT1348654151579 *model = self.dataArray[indexPath.row];
    if (indexPath.row == 0) {
        NewsScrollViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsscrollcell" forIndexPath:indexPath];
        _bannerView = [KNBannerView bannerViewWithNetWorkImagesArr:_imgArray frame:CGRectMake(0, 0, VIEW_WIDTH, 150)];
        _bannerView.delegate = self;
        _bannerView.IntroduceStringArr = _titleArray;
        _bannerView.textShowStyle = KNTextShowStyleStay;
        _bannerView.tag = 100;
        [cell addSubview:_bannerView];
        return cell;
    }else{
        if (model.imgextra.count > 0) {
            NewsImageMoreTableViewCell *newsImagemoreCell= [tableView dequeueReusableCellWithIdentifier:@"newsimagemorecell" forIndexPath:indexPath];
            newsImagemoreCell.gmodel = model;
            return newsImagemoreCell;
            
        }else if (model.imgType){
            NewsImageTableViewCell *newsImageCell= [tableView dequeueReusableCellWithIdentifier:@"newsimagecell" forIndexPath:indexPath];
            newsImageCell.gmodel = model;
            return newsImageCell;
            
        }else{
            NewsTableViewCell *newsCell = [tableView dequeueReusableCellWithIdentifier:@"newscell" forIndexPath:indexPath];
            newsCell.gmodel = model;
            return newsCell;
            
            
        }
        
    }

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsGameT1348654151579 *model = self.dataArray[indexPath.row];
    
    if (indexPath.row == 0 || model.imgextra.count>0 || model.imgType) {
        return 150;
    }else{
        return 90;
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsGameT1348654151579 *model = self.dataArray[indexPath.row];
    
    if (model.imgextra.count>0) {
        NewsImageViewController *imageVC = [[NewsImageViewController alloc] init];
        [self.navigationController pushViewController:imageVC animated:YES];
    }else{
        NewsWebViewController *webVC = [[NewsWebViewController alloc] init];
        webVC.URLHtml = model.url;
        [self.navigationController pushViewController:webVC animated:YES];
    }
}


- (void)bannerView:(KNBannerView *)bannerView collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSInteger)index{
    NewsGameT1348654151579 *model = self.dataArray[0];
    NewsWebViewController *webVC = [[NewsWebViewController alloc] init];
    if (index == 0) {
        webVC.URLHtml = model.url;
    }else{
        webVC.URLHtml = @"http://3g.163.com/tech/16/1008/16/C2RDK5ND00097U7V.html";
        
    }
    [self.navigationController pushViewController:webVC animated:YES];
    
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
