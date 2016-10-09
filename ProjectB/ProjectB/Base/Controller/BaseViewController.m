//
//  BaseViewController.m
//  ProjectB
//
//  Created by long on 16/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import "BaseViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "MMDrawerController.h"
#import "UIViewController+MMDrawerController.h"


@interface BaseViewController ()

@property (nonatomic,strong) UIImage *image;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (self.navigationController.viewControllers.count == 1) {
        [self showMsg];
    }
    else{
        [self goback];
    }
}

//自定义侧边栏按键
-(void)showMsg{
    BOOL isY = YES;
    if (isY) {
        _image = [UIImage imageNamed:@"left_nologin"];
    }
    else{
        _image = [UIImage imageNamed:@""];
    }
 
    _ImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    _ImgView.image = _image;
    _ImgView.layer.cornerRadius = 20;
    _ImgView.clipsToBounds = YES;
    CALayer *layer = [_ImgView layer];
    layer.borderColor = [UIColor cyanColor].CGColor;
    layer.borderWidth = 2.0f;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_ImgView];
    
    DWSwipeGestures *click = [[DWSwipeGestures alloc]init];
    [click dw_SwipeGestureType:DWTapGesture Target:self Action:@selector(leftDrawerButtonPress:) AddView:_ImgView BackSwipeGestureTypeString:^(NSString * _Nonnull backSwipeGestureTypeString) {
    }];
}

-(void)leftDrawerButtonPress:(id)sender{    
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
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
