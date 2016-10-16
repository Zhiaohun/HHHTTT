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

@interface NewsImageViewController ()
@property (nonatomic, strong) NSMutableArray *mArr;

@end

@implementation NewsImageViewController

-(NSMutableArray *)mArr{
    if (!_mArr) {
        _mArr = [NSMutableArray array];
    }
    return _mArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self goback];
    self.view.backgroundColor = [UIColor blackColor];
    [self loadImages];
    
    
}


-(void)loadImages{
    
    for (int i = 0; i < self.imageArray.count; i++) {
        
        [self.mArr addObject:[self.imageArray[i] imgsrc]];
        
    }
    ScrollImage *scroll = [[ScrollImage alloc] initWithCurrentController:self urlString:self.mArr labString:nil viewFrame:CGRectMake(0, 150, VIEW_WIDTH, 200) placeholderImage:PlaceholderImage startAnimated:NO];
    [self.view addSubview:scroll.view];
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
