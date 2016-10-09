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
@interface VideoCategoryCollectionViewController ()
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) BaseClass *baseModel;
@property (nonatomic, strong) NSMutableArray *videoDataArray;
@end

@implementation VideoCategoryCollectionViewController

-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
   
    [self dataRequest];
    
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
        _flowLayout.itemSize = CGSizeMake((VIEW_WIDTH-10)/2,140);
        _flowLayout.minimumLineSpacing = 5;
        _flowLayout.sectionInset = UIEdgeInsetsMake(5, 0, 5, 0);
        _flowLayout.headerReferenceSize = CGSizeMake(VIEW_WIDTH, 180);
    }
    return _flowLayout;
}

-(NSMutableArray *)videoDataArray{
    if (!_videoDataArray) {
        _videoDataArray = [NSMutableArray array];
    }
    return _videoDataArray;
}
-(void)dataRequest{
   [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:URL_VideoList Parameter:nil Success:^(NSDictionary *dic) {
       self.baseModel = [BaseClass modelObjectWithDictionary:dic];
       NSLog(@"%@",self.baseModel);
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





-(void)tapHeaderViewAction{
    VideoListTableViewController *videoListVC = [[VideoListTableViewController alloc] init];
    videoListVC.listModel = [[ItemList alloc] init];
    videoListVC.listModel = self.baseModel.itemList[3];
    [self.navigationController pushViewController:videoListVC animated:YES];
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

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    
    VideoHeaderCollectionViewCell *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind  withReuseIdentifier:@"videoheadercell" forIndexPath:indexPath];
    
    headerView.listModel = self.baseModel.itemList[3];
    
    DWSwipeGestures *gesture = [[DWSwipeGestures alloc] init];
    [gesture dw_SwipeGestureType:DWTapGesture Target:self Action:@selector(tapHeaderViewAction) AddView:headerView BackSwipeGestureTypeString:^(NSString * _Nonnull backSwipeGestureTypeString) {
        NSLog(@"%@",backSwipeGestureTypeString);
    }];
    
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

@end
