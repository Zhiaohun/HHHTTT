//
//  VideoDetailViewController.m
//  ProjectB
//
//  Created by long on 2016/9/30.
//  Copyright © 2016年 long. All rights reserved.
//

#import "VideoDetailViewController.h"
#import "VideoListDataModels.h"
#import "MoviePlayerViewController.h"
#import "UIImageView+imageViewAnimation.h"

@interface VideoDetailViewController ()
@property (nonatomic, strong) VideoListItemList *listModel;
@property (nonatomic, assign) NSInteger index;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UIImageView *playImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *blurImageView;

@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIButton *collectionBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (weak, nonatomic) IBOutlet UIButton *cacheBtn;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UIView *progressView;
@property (nonatomic, assign) CGFloat offSet;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *countLabelX;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *progressViewX;



@end

@implementation VideoDetailViewController


-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"_+_+_+_+_+_+_+_+_+_++_+_%lu",self.dataArray.count);
    [self.view insertSubview:self.blurImageView atIndex:0];
    self.index = self.selectIndex;
    self.listModel = [[VideoListItemList alloc] init];
    
   
    
    
    //手势初始化
    DWSwipeGestures *gesture = [[DWSwipeGestures alloc] init];
    gesture.numberOfTouchesRequired = 1;
    /*
    //左滑手势
    [gesture dw_SwipeGestureType:DWLeftSwipeGestures Target:self Action:@selector(leftGestureAction) AddView:self.imageV BackSwipeGestureTypeString:^(NSString * _Nonnull backSwipeGestureTypeString) {
        NSLog(@"%@",backSwipeGestureTypeString);
    }];
    
 
    //右滑手势
    [gesture dw_SwipeGestureType:DWRightSwipeGestures Target:self Action:@selector(rightGestureAction) AddView:self.imageV BackSwipeGestureTypeString:^(NSString * _Nonnull backSwipeGestureTypeString) {
        NSLog(@"%@",backSwipeGestureTypeString);
    }];
     */
    //点击手势
    [gesture dw_SwipeGestureType:DWTapGesture Target:self Action:@selector(tapAction) AddView:self.imageV BackSwipeGestureTypeString:^(NSString * _Nonnull backSwipeGestureTypeString) {
        NSLog(@"%@",backSwipeGestureTypeString);
    }];
    [gesture dw_SwipeGestureType:DWTapGesture Target:self Action:@selector(tapAction) AddView:self.playImageView BackSwipeGestureTypeString:^(NSString * _Nonnull backSwipeGestureTypeString) {
        NSLog(@"%@",backSwipeGestureTypeString);
    }];
   
    
    
    [self upDateUI];
    
}

/*
-(void)leftGestureAction{
    NSLog(@"left.....");
    self.index++;
    [self upDateUI];
    
    
}
-(void)rightGestureAction{
    self.index--;
    [self upDateUI];
    
}
*/
-(void)tapAction{
    self.listModel = self.dataArray[self.index];
   
    MoviePlayerViewController *moviePlayVC = [[MoviePlayerViewController alloc] init];
    moviePlayVC.dataArray = self.dataArray;
    moviePlayVC.selectIndex = self.selectIndex;
    [self presentViewController:moviePlayVC animated:YES completion:nil];

    
}

//初始化UI
-(void)upDateUI{
    
    self.listModel = self.dataArray[self.index];
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:_listModel.data.cover.feed] placeholderImage:PlaceholderImage];
    
    [self.imageV backgroundImageAnimation];

    [self.blurImageView sd_setImageWithURL:[NSURL URLWithString:_listModel.data.cover.blurred]];
    self.titleLabel.text = _listModel.data.title;
    
    NSString *time = [NSString stringWithFormat:@"%02d'%02d''",(int)self.listModel.data.duration / 60,(int)self.listModel.data.duration % 60];
    self.descLabel.text = [NSString stringWithFormat:@"#%@ / %@",self.listModel.data.category,time];
    self.contentLabel.text = self.listModel.data.dataDescription;
    [self.collectionBtn setTitle:[NSString stringWithFormat:@"%d",(int)self.listModel.data.consumption.collectionCount] forState:UIControlStateNormal];
    [self.shareBtn setTitle:[NSString stringWithFormat:@"%d",(int)self.listModel.data.consumption.shareCount] forState:UIControlStateNormal];
    self.cacheBtn.titleLabel.text = @"缓存";
    
    _offSet  =  VIEW_WIDTH / self.dataArray.count;
    self.countLabel.text = [NSString stringWithFormat:@"%lu/%lu",self.index+1,self.dataArray.count];
    
    self.countLabelX.constant += _offSet * self.index;
    self.progressViewX.constant += _offSet * self.index;
       
    
    
    
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

@end
