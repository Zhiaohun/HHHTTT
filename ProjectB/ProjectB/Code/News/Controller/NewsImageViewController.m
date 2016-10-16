//
//  NewsImageViewController.m
//  ProjectB
//
//  Created by long on 2016/9/29.
//  Copyright © 2016年 long. All rights reserved.
//

#import "NewsImageViewController.h"
#import "ScrollImage.h"
#import "NewsTechnologyImgextra.h"
#import <WebKit/WebKit.h>

@interface NewsImageViewController ()<WKNavigationDelegate>
@property (nonatomic, strong) NSMutableArray *mArr;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *countLabel;
@property (nonatomic, strong) MBProgressHUD *hud;

@end

@implementation NewsImageViewController


-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}
-(void)viewDidDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
     [_hud hideAnimated:YES];
}

-(NSMutableArray *)mArr{
    if (!_mArr) {
        _mArr = [NSMutableArray array];
    }
    return _mArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"详情";
    [self goback];
    
    self.view.backgroundColor = [UIColor blackColor];
 
  //  [self scrollView];
    
   
    
    _hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    
    // Set some text to show the initial status.
    _hud.label.text = @"正在努力加载数据...";
    // Will look best, if we set a minimum size.
    _hud.minSize = CGSizeMake(150.f, 100.f);
    
    [self dataRequest];
    
   
  
    
}

-(void)dataRequest{
    NSArray *array = [self.skipID componentsSeparatedByString:@"|"];
    NSLog(@">>>>>%@",array);
    WKWebView *webview = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://news.163.com/photoview/%@/%@.html",array[0],array[1]]]];
    [webview loadRequest:request];
    webview.navigationDelegate = self;
    [self.view addSubview:webview];
  
    
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation{
  
        [_hud hideAnimated:YES afterDelay:1];
  
}


/*

-(UIScrollView *)scrollView{
    
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _scrollView.contentSize = CGSizeMake(VIEW_WIDTH*self.imageArray.count, VIEW_HEIGHT);
        for (int i = 0; i < self.imageArray.count; i++) {
            
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(i*VIEW_WIDTH, 0, VIEW_WIDTH, VIEW_HEIGHT)];
            [imgView sd_setImageWithURL:[NSURL URLWithString:self.imageArray[i]] placeholderImage:PlaceholderImage];
            [self.scrollView addSubview:imgView];
        }
        _scrollView.delegate = self;
        
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}


*/

/*
-(void)loadImages{
    
//    for (int i = 0; i < self.imageArray.count; i++) {
//        
//        [self.mArr addObject:[self.imageArray[i] imgsrc]];
//        
//    }
//    ScrollImage *scroll = [[ScrollImage alloc] initWithCurrentController:self urlString:self.mArr labString:nil viewFrame:CGRectMake(0, 150, VIEW_WIDTH, 200) placeholderImage:PlaceholderImage startAnimated:NO];
//    [self.view addSubview:scroll.view];
    
 
    
}
 */

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
