//
//  NewsWebViewController.m
//  ProjectB
//
//  Created by long on 2016/9/29.
//  Copyright © 2016年 long. All rights reserved.
//

#import "NewsWebViewController.h"
#import <WebKit/WebKit.h>

@interface NewsWebViewController ()//<UIWebViewDelegate>
@end

@implementation NewsWebViewController

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear: YES];
    [self.navigationController setValue:[UINavigationBar new] forKey:@"navigationBar"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
    
    
    
}
#pragma mark - private Method -
-(void)initUI{

    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT)];
    [self.view addSubview:webView];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.URLHtml]];
    
    [webView loadRequest:request];
    
    [self goback];
     
     
  
   
    
     /*
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT)];
    webView.delegate = self;
    
    [self.view addSubview:webView];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.URLHtml]];
    
    [webView loadRequest:request];
    
    [self goback];
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




/** 页面加载完成之后调用 */
-(void)webViewDidFinishLoad:(UIWebView *)webView{
   NSLog(@"++++++++++++++%@",[webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('article_title')[0]"]);
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('js-time')[0]"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('js-source')[0]"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('page-content page-on')[0]"];
    
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
