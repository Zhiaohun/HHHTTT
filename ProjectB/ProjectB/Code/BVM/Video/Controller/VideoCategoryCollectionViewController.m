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
@interface VideoCategoryCollectionViewController ()
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@end

@implementation VideoCategoryCollectionViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
   
    
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.collectionViewLayout = [self flowLayout];
    UINib *normalNib = [UINib nibWithNibName:@"VideoNormalCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:normalNib forCellWithReuseIdentifier:@"normalcell"];
    UINib *headerNib = [UINib nibWithNibName:@"VideoHeaderCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:headerNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"videoheadercell"];
    // Do any additional setup after loading the view.
}
-(UICollectionViewFlowLayout *)flowLayout{
    if(!_flowLayout){
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.itemSize = CGSizeMake((VIEW_WIDTH-20)/2,140);
        _flowLayout.minimumLineSpacing = 5;
        _flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        _flowLayout.headerReferenceSize = CGSizeMake(VIEW_WIDTH, 180);
    }
    return _flowLayout;
}

-(void)tapHeaderViewAction{
    VideoListTableViewController *videoListVC = [[VideoListTableViewController alloc] init];
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
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    VideoNormalCollectionViewCell *normalCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"normalcell" forIndexPath:indexPath];
    
    return normalCell;
    
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    
    VideoHeaderCollectionViewCell *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind  withReuseIdentifier:@"videoheadercell" forIndexPath:indexPath];
    
    DWSwipeGestures *gesture = [[DWSwipeGestures alloc] init];
    [gesture dw_SwipeGestureType:DWTapGesture Target:self Action:@selector(tapHeaderViewAction) AddView:headerView BackSwipeGestureTypeString:nil];
    return headerView;
    
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    VideoListTableViewController *videoListVC = [[VideoListTableViewController alloc] init];
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
