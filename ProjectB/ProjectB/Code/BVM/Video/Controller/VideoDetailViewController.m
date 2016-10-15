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
#import "ZXVideoPlayerController.h"

#import "LLShowHUD.h"
#import "WeiboSDK.h"

#import "ZFPlayerView.h"






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

@property (nonatomic, assign) BOOL isCacheBtnSelected;

@property (nonatomic, assign) BOOL isCollectionBtnSelected;
@property (nonatomic, strong) ZXVideoPlayerController *videoController;

@property (nonatomic, strong) ZFPlayerView *playerView;
/** 离开页面时候是否在播放 */
@property (nonatomic, assign) BOOL isPlaying;


@end

@implementation VideoDetailViewController




- (void)viewWillAppear:(BOOL)animated
{
    
       self.tabBarController.tabBar.hidden = YES;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"_+_+_+_+_+_+_+_+_+_++_+_%lu",self.dataArray.count);
    [self.view insertSubview:self.blurImageView atIndex:0];
    self.index = self.selectIndex;
    self.listModel = [[VideoListItemList alloc] init];
    self.listModel = self.dataArray[self.index];
    
   
    
    
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
    
   // [self goback];
    
    
    
    
    //if use Masonry,Please open this annotation
    /*
     UIView *topView = [[UIView alloc] init];
     topView.backgroundColor = [UIColor blackColor];
     [self.view addSubview:topView];
     [topView mas_updateConstraints:^(MASConstraintMaker *make) {
     make.top.left.right.equalTo(self.view);
     make.height.mas_offset(20);
     }];
      */

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
   // self.listModel = self.dataArray[self.index];
    
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
   
    [self playVideo];
//    MoviePlayerViewController *moviePlayVC = [[MoviePlayerViewController alloc] init];
//    moviePlayVC.dataArray = self.dataArray;
//    moviePlayVC.selectIndex = self.selectIndex;
//    [self presentViewController:moviePlayVC animated:YES completion:nil];

    
}

//初始化UI
-(void)upDateUI{
    
    self.listModel = self.dataArray[self.index];
     self.title = self.listModel.data.title;
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


-(void)playVideo{
    
    /*
    self.listModel = self.dataArray[self.index];
  

    if (!self.videoController) {
        
        self.videoController = [[ZXVideoPlayerController alloc] initWithFrame:CGRectMake(0, 64, self.imageV.frame.size.width, self.imageV.frame.size.height)];
        self.videoController.video = [[ZXVideo alloc] init];
        __weak typeof(self) weakSelf = self;
        self.videoController.videoPlayerGoBackBlock = ^{
            __strong typeof(self) strongSelf = weakSelf;
            
          //  [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
           
            
            [strongSelf.navigationController popViewControllerAnimated:YES];
            [strongSelf.navigationController setNavigationBarHidden:NO animated:YES];
            
            [[NSUserDefaults standardUserDefaults] setObject:@0 forKey:@"ZXVideoPlayer_DidLockScreen"];
            
            strongSelf.videoController = nil;
        };
        
        self.videoController.videoPlayerWillChangeToOriginalScreenModeBlock = ^(){
            NSLog(@"切换为竖屏模式");
        };
        self.videoController.videoPlayerWillChangeToFullScreenModeBlock = ^(){
            NSLog(@"切换为全屏模式");
        };
        
        [self.videoController showInView:self.view];
    }
    
    
    self.videoController.video.playUrl = self.listModel.data.playUrl;
    NSLog(@"url____%@",self.videoController.video.playUrl);
    self.videoController.video.title = self.listModel.data.title;
 */
    self.imageV.hidden = YES;
    self.playImageView.hidden = YES;
    
    
    self.playerView = [[ZFPlayerView alloc] initWithFrame:CGRectMake(0, 20, self.imageV.frame.size.width, self.imageV.frame.size.height+44)];
    
    [self.view addSubview:self.playerView];
    
    
    // 设置播放前的占位图（需要在设置视频URL之前设置）
    self.playerView.placeholderImageName = nil;
    // 设置视频的URL
    self.playerView.videoURL = [NSURL URLWithString:self.listModel.data.playUrl];
    // 设置标题
    self.playerView.title = self.listModel.data.title;
    //（可选设置）可以设置视频的填充模式，内部设置默认（ZFPlayerLayerGravityResizeAspect：等比例填充，直到一个维度到达区域边界）
    self.playerView.playerLayerGravity = ZFPlayerLayerGravityResizeAspect;
    
    // 打开下载功能（默认没有这个功能）
    self.playerView.hasDownload = NO;
    // 下载按钮的回调
    self.playerView.downloadBlock = ^(NSString *urlStr) {
        //        // 此处是截取的下载地址，可以自己根据服务器的视频名称来赋值
        //        NSString *name = [urlStr lastPathComponent];
        //        [[ZFDownloadManager sharedDownloadManager] downFileUrl:urlStr filename:name fileimage:nil];
        //        // 设置最多同时下载个数（默认是3）
        //        [ZFDownloadManager sharedDownloadManager].maxCount = 1;
        //self.playerView.
        
    };
    
    // 如果想从xx秒开始播放视频
    // self.playerView.seekTime = 15;
    
    // 是否自动播放，默认不自动播放
    [self.playerView autoPlayTheVideo];
    __weak typeof(self) weakSelf = self;
    self.playerView.goBackBlock = ^{
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    
    


}
- (IBAction)shareBtnAction:(id)sender {
        [Share shareToWeiBo:@[self.listModel.data.cover.feed] Content:self.listModel.data.dataDescription URLStr:nil Title:_listModel.data.title];
   
    
    
}
- (IBAction)cacheBtnAction:(id)sender {
    
    UIButton *btn = (UIButton *)sender;
    if (!self.isCacheBtnSelected) {
        [btn setImage:[UIImage imageNamed:@"cached"] forState:UIControlStateNormal];
        [btn setTitle:@"已缓存" forState:UIControlStateNormal];
        self.isCacheBtnSelected = YES;

    }else{
        [LLShowHUD showHUD:self.view Message:@"您已经缓存过!" AfterDelay:1];
    }
    
}
- (IBAction)cololectionAction:(id)sender {
    
    if (!self.isCollectionBtnSelected) {
        [self.collectionBtn setTitle:[NSString stringWithFormat:@"%d",(int)self.listModel.data.consumption.collectionCount + 1] forState:UIControlStateNormal];
        [self.collectionBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.collectionBtn setImage:[UIImage imageNamed:@"global_comment_praised"] forState:UIControlStateNormal];
        [self.collectionBtn.imageView spotAnimation];
        self.isCollectionBtnSelected = YES;
        
    }else{
        [LLShowHUD showHUD:self.view Message:@"你已经赞过了!" AfterDelay:0.5];
    }
   
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
