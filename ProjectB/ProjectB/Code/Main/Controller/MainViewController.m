//
//  MainViewController.m
//  img
//
//  Created by 芏小川 on 2016/10/11.
//  Copyright © 2016年 lanou. All rights reserved.
//


#import "MainViewController.h"
#import "LYScrollView.h"
#import "UIImageEffects.h"
#import "UIViewController+MMDrawerController.h"
#import "MainDataModels.h"



@interface MainViewController ()<BeginRefresh>

@property (nonatomic, strong) LYScrollView * scrollView;
@property (nonatomic, strong) NSMutableArray * itmeArray;
@property (nonatomic, strong) UIImageView * imageView;

@property (nonatomic,strong) UIImageView *ImageView;
@property (nonatomic,strong) UIImage *image;

@property (nonatomic,strong) UIView *view1;
@property (nonatomic,strong) UITapGestureRecognizer *gest ;
@property (nonatomic,assign) CGRect rect;


@property (nonatomic,strong) MainBaseClass *base;
@property (nonatomic,assign) NSInteger refresh;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestData];
    [self initUI];
    
    
}
-(void)viewWillAppear:(BOOL)animated{

    if (![JudgeManager defaultManager].MainBGImg) {
        self.imageView.image = [UIImage imageNamed:@"BG_1"];
    }
    else{
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:[JudgeManager defaultManager].MainBGImg]];
    }
    
    [super viewWillAppear: animated];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(XXXrefresh) name:@"refresh" object:nil];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"refresh" object:nil];
}

#pragma mark - private Method -
-(void)initUI{
    self.navigationController.navigationBarHidden = YES;
    [JudgeManager defaultManager].originColor = _originalView.backgroundColor;
    [self handleScroImg];
    [self handleUserImg];
}

//    _scrollView.setdelegate = self;
    

//-(void)beginRefresh{
//    _refresh = 1;
//    [self requestData];
//}
-(void)XXXrefresh{
    _refresh = 1;
    [self requestData];
}



-(void)handleUserImg{
    if (![JudgeManager defaultManager].isLogin) {
        _image = [UIImage imageNamed:@"left_nologin"];
    }
    else{
        _image = [UIImage imageNamed:@""];
    }
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(20, 20, 40, 40)];
    
    _ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, 40, 40)];
    _ImageView.image = _image;
    _ImageView.layer.cornerRadius = 20;
    _ImageView.clipsToBounds = YES;
    CALayer *layer = [_ImageView layer];
    layer.borderColor = [UIColor cyanColor].CGColor;
    layer.borderWidth = 2.0f;
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    gesture.numberOfTapsRequired = 1;
    [view1 addGestureRecognizer:gesture];
    
    [view1 addSubview:_ImageView];
    [self.view addSubview:view1];
}

-(void)leftDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

-(void)handleScroImg{
    self.imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.imageView];
    self.imageView.backgroundColor = [UIColor lightGrayColor];

    
   // self.imageView.image = [self blurViewByLightEffectWithImage:[UIImage imageNamed:@"BG_1.jpg"]];
    
    
    self.scrollView = [[LYScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    self.scrollView.delegate = self;
    self.scrollView.isOpenDelete = NO;
    
    
   // NSLog(@"+++++++%@",_base.textcardlist);
    //self.scrollView.itmeArray = [NSMutableArray arrayWithArray:_base.textcardlist];
    //self.scrollView.mainBase = _base;
    
    [self.view addSubview:self.scrollView];
}
//-(void)scrolIndex:(NSInteger)index
//{
//    if (self.itmeArray.count > index) {
//        self.imageView.image = [self blurViewByLightEffectWithImage:self.itmeArray[index]];
//    }
//}

- (UIImage *)blurViewByLightEffectWithImage:(UIImage *)screenImage
{
    UIImage * blurImage = [UIImageEffects imageByApplyingLightEffectToImage:screenImage];
    return blurImage;
}

-(void)requestData{
    
    [LLNetWorkingRequest reuqestWithType:GET Controller:self URLString:URL_Main Parameter:nil Success:^(NSDictionary *dic) {
        _base = [MainBaseClass modelObjectWithDictionary:dic];
        if (_base) {
             dispatch_async(dispatch_get_main_queue(), ^{
                 if (_refresh == 1) {
                     [_scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                     [self handleScroImg];
                     [self handleUserImg];
                 }
                 _refresh = 0;
                 self.scrollView.itmeArray = [NSMutableArray arrayWithArray:_base.textcardlist];
                 [_scrollView.swifthud stopLoadHUD];
             });
            NSLog(@"有数据");
        }
        
        
        
    } Fail:^(NSError *error) {
        NSLog(@"请求首页数据失败");
    }];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
