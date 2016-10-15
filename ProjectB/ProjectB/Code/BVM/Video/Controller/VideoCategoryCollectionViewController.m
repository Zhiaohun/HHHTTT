//
//  VideoCategoryCollectionViewController.m
//  ProjectB
//
//  Created by long on 2016/9/29.
//  Copyright © 2016年 long. All rights reserved.
//

#import "VideoCategoryCollectionViewController.h"
#import "VideoNormalCollectionViewCell.h"
#import "VideoHeaderCollectionViewCell.h"
#import "VideoListTableViewController.h"
#import "VideoCategoryDataModels.h"
#import "VideoListDataModels.h"
#import "YYScrollView.h"
#import "MoviePlayerViewController.h"


#import "NewPagedFlowView.h"
#import "PGIndexBannerSubiew.h"

#import "VideoFullScreenViewController.h"

@interface VideoCategoryCollectionViewController ()<NewPagedFlowViewDelegate, NewPagedFlowViewDataSource>

{
    NSArray *_array;
}

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) BaseClass *baseModel;
@property (nonatomic, strong) NSMutableArray *videoDataArray;
@property (nonatomic, strong) NSMutableArray *headerImageArray;
@property (nonatomic, strong) NSMutableArray *headerDataArray;
@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) NewPagedFlowView *pageFlowView;


@property (nonatomic, strong) YYScrollView *scroll;

@end

@implementation VideoCategoryCollectionViewController

-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear: YES];
    [self.navigationController setValue:[UINavigationBar new] forKey:@"navigationBar"];
}

-(NSMutableArray *)videoDataArray{
    if (!_videoDataArray) {
        _videoDataArray = [NSMutableArray array];
    }
    return _videoDataArray;
}
-(NSMutableArray *)headerImageArray{
    if (!_headerImageArray) {
        _headerImageArray = [NSMutableArray array];
    }
    return _headerImageArray;
}

-(NSMutableArray *)headerDataArray{
    if (!_headerDataArray) {
        _headerDataArray = [NSMutableArray array];
    }
    return _headerDataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"视频类别";
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
   
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    [LLShowHUD showDataRequestHUD:self.view Message:@"正在加载数据..." NetWorkRequest:^{
        [self headerDataRequest];
        
        [self dataRequest];
    }];
    
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.collectionViewLayout = [self flowLayout];
    UINib *normalNib = [UINib nibWithNibName:@"VideoNormalCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:normalNib forCellWithReuseIdentifier:@"normalcell"];
    UINib *headerNib = [UINib nibWithNibName:@"VideoHeaderCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:headerNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"videoheadercell"];
    
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

-(UICollectionViewFlowLayout *)flowLayout{
    if(!_flowLayout){
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.itemSize = CGSizeMake((VIEW_WIDTH-3)/2,140);
        _flowLayout.minimumLineSpacing = 3;
        _flowLayout.minimumInteritemSpacing = 3;
        _flowLayout.sectionInset = UIEdgeInsetsMake(3, 0, 3, 0);
        _flowLayout.headerReferenceSize = CGSizeMake(VIEW_WIDTH, 180);
    }
    return _flowLayout;
}


-(void)dataRequest{
   [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:URL_VideoList Parameter:nil Success:^(NSDictionary *dic) {
       
       dispatch_async(dispatch_get_main_queue(), ^{
           [MBProgressHUD hideHUDForView:self.view animated:YES];
       });
       self.baseModel = [BaseClass modelObjectWithDictionary:dic];
      // NSLog(@"%@",self.baseModel);
       for (int i= 0; i < self.baseModel.itemList.count; i++) {
           if (i > 3) {
               [self.videoDataArray addObject:self.baseModel.itemList[i]];
           }
       }
       dispatch_async(dispatch_get_main_queue(), ^{
          
           [self.collectionView reloadData];

           
        });
       
   } Fail:^(NSError *error) {
       NSLog(@">>>>>%@",error);
   }];
}


-(void)headerDataRequest{
    [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:URL_VideoHeader Parameter:nil Success:^(NSDictionary *dic) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
        NSArray *sectionArray = [NSArray array];
        sectionArray = dic[@"sectionList"];
        
        NSArray *listArray = [NSArray array];
        listArray = sectionArray[0][@"itemList"];
        for (NSDictionary *dic in listArray) {
            if ([dic[@"type"] isEqualToString:@"video"]) {
                VideoListItemList *model = [[VideoListItemList alloc] init];
                model = [VideoListItemList modelObjectWithDictionary:dic];
                NSLog(@"++++++++++++++++++++++++++++++++%@",model);
                [self.headerDataArray addObject:model];
                NSString *str = dic[@"data"][@"cover"][@"feed"];
                [self.headerImageArray addObject:str];
          
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
          [self.collectionView reloadData];

        });
        
    } Fail:^(NSError *error) {
        NSLog(@"_+_+_+_+%@",error);
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.videoDataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    VideoNormalCollectionViewCell *normalCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"normalcell" forIndexPath:indexPath];
    
        ItemList *listModel = self.videoDataArray[indexPath.row];
         normalCell.listModel = listModel;
   
    
    return normalCell;
    
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    cell.layer.transform = CATransform3DMakeScale(0.2, 0.2, 1);
    [UIView animateWithDuration:0.5 animations:^{
        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    
    VideoHeaderCollectionViewCell *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind  withReuseIdentifier:@"videoheadercell" forIndexPath:indexPath];
  

    _pageFlowView = [[NewPagedFlowView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, (VIEW_WIDTH - 84) * 9 / 16 + 24)];
    _pageFlowView.backgroundColor = [UIColor whiteColor];
    _pageFlowView.delegate = self;
    _pageFlowView.dataSource = self;
    _pageFlowView.minimumPageAlpha = 0.4;
    _pageFlowView.minimumPageScale = 0.85;
    _pageFlowView.orientation = NewPagedFlowViewOrientationHorizontal;
    _pageFlowView.isOpenAutoScroll = NO;
    
    //初始化pageControl
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, _pageFlowView.frame.size.height - 24 - 8, VIEW_WIDTH, 8)];
    _pageFlowView.pageControl = pageControl;
    [_pageFlowView addSubview:pageControl];
   
    [_pageFlowView reloadData];
    
    
    [headerView addSubview:_pageFlowView];
    
    return headerView;
    
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    VideoListTableViewController *videoListVC = [[VideoListTableViewController alloc] init];
    videoListVC.listModel = [[ItemList alloc] init];
    videoListVC.listModel = self.videoDataArray[indexPath.row];
    [self.navigationController pushViewController:videoListVC animated:YES];
}
#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/







#pragma mark NewPagedFlowView Delegate

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (CGSize)sizeForPageInFlowView:(NewPagedFlowView *)flowView {
    return CGSizeMake(VIEW_WIDTH - 84, (VIEW_WIDTH - 84) * 9 / 16);
}

- (void)didSelectCell:(UIView *)subView withSubViewIndex:(NSInteger)subIndex {
    
    NSLog(@"点击了第%ld张图",(long)subIndex+1);
    
    VideoFullScreenViewController *moviePlayVC = [[VideoFullScreenViewController alloc] init];
    moviePlayVC.dataArray = [NSArray array];
    moviePlayVC.dataArray = self.headerDataArray;
    moviePlayVC.selectIndex = (long)subIndex;
   // [self.navigationController pushViewController:moviePlayVC animated:YES];
    [self presentViewController:moviePlayVC animated:YES completion:nil];
    
    
    
    
   
}

#pragma mark NewPagedFlowView Datasource
- (NSInteger)numberOfPagesInFlowView:(NewPagedFlowView *)flowView {
    NSLog(@"____________%lu",self.headerImageArray.count);
    return self.headerImageArray.count;
    
}

- (UIView *)flowView:(NewPagedFlowView *)flowView cellForPageAtIndex:(NSInteger)index{
    PGIndexBannerSubiew *bannerView = (PGIndexBannerSubiew *)[flowView dequeueReusableCell];
    if (!bannerView) {
        bannerView = [[PGIndexBannerSubiew alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH - 84, (VIEW_WIDTH - 84) * 9 / 16)];
        bannerView.layer.cornerRadius = 4;
        bannerView.layer.masksToBounds = YES;
    }
    //在这里下载网络图片

    [bannerView.mainImageView sd_setImageWithURL:[NSURL URLWithString:self.headerImageArray[index]]];
  
    return bannerView;
}

- (void)didScrollToPage:(NSInteger)pageNumber inFlowView:(NewPagedFlowView *)flowView {
    
    NSLog(@"ViewController 滚动到了第%ld页",pageNumber);
}

#pragma mark --旋转屏幕改变newPageFlowView大小之后实现该方法
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id)coordinator {
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        [coordinator animateAlongsideTransition:^(id context) { [self.pageFlowView reloadData]; } completion:NULL];
    }
}

- (void)dealloc {
    
    /****************************
     在dealloc或者返回按钮里停止定时器
     ****************************/
    
    [self.pageFlowView stopTimer];
}



-(void)imageClickWithIndex:(NSInteger)index
{
    NSLog(@"点击的是第%ld张图片",index+1);
}




@end
