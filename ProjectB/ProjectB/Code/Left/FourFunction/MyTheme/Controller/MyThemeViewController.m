//
//  MyThemeViewController.m
//  ProjectB
//
//  Created by 芏小川 on 2016/10/21.
//  Copyright © 2016年 long. All rights reserved.
//

#import "MyThemeViewController.h"
#import "ImageModel.h"
#import "CollectionViewCell.h"
#import "WaterFlow.h"

#define KSCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
@interface MyThemeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,WaterFlowDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic, strong) NSMutableArray *modelArray;

@end

@implementation MyThemeViewController

-(NSMutableArray *)modelArray{
    if (_modelArray == nil) {
        self.modelArray = [NSMutableArray array];
    }
    return _modelArray;
}

-(void)handleData{
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    
    if (jsonData != nil) {
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
        for (NSDictionary *dic in jsonArray) {
            ImageModel *imageModel = [[ImageModel alloc] init];
            [imageModel setValuesForKeysWithDictionary:dic];
            [self.modelArray addObject:imageModel];
        }
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self handleData];
}

-(void)initUI{
//    self.title = @"我的主题";
    JudgeManager *manager = [JudgeManager defaultManager];
    self.navigationItem.titleView = [manager setFont:@"我的主题"];
    [self collection];
    [self goback];
    [self defaulted];
}
-(void)defaulted{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"还原" style:UIBarButtonItemStylePlain target:self action:@selector(customed)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor cyanColor];
    
}
-(void)customed{
    [JudgeManager defaultManager].MainBGImg = nil;
    [JudgeManager defaultManager].LeftBGImg = nil;
    if (![JudgeManager defaultManager].MainBGImg && ![JudgeManager defaultManager].LeftBGImg) {
        [self showSucHUDWithMessage:@"还原成功!"];
    }
    else{
        [self showSucHUDWithMessage:@"还原失败!"];
    }
}

//自定义返回键
-(void)goback{
    UIImage *image = [[UIImage imageNamed:@"返回"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(TapLeftAction)];
}
-(void)TapLeftAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)collection{
    
    WaterFlow *flowLayout = [[WaterFlow alloc] init];
    flowLayout.delegate = self;
    CGFloat width = (KSCREENWIDTH - 40) / 3;
    flowLayout.itemSize = CGSizeMake(width, width);
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 10;
    flowLayout.sectionInset  =UIEdgeInsetsMake(10, 10, 10, 10);
    flowLayout.numberOfColumns = 3;
    
    
    UICollectionView  *collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    // self.view.backgroundColor = [UIColor whiteColor];
    UINib *nib = [UINib nibWithNibName:@"CollectionViewCell" bundle:nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"cell"];    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.modelArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    ImageModel *model = self.modelArray[indexPath.row];
    cell.model = model;
    
    return cell;
}

-(CGFloat)heightForIndex:(NSIndexPath *)indexPath{
    
    ImageModel *model = self.modelArray[indexPath.item];
    CGFloat currentWidth = (KSCREENWIDTH-40)/3;
    
    CGFloat currentHeight = model.height / model.width * currentWidth;
    return currentHeight;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{


    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {
        
    }];
    
    UIAlertAction *main = [UIAlertAction actionWithTitle:@"设定首页" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        ImageModel *model = self.modelArray[indexPath.row];
        [JudgeManager defaultManager].MainBGImg = model.thumbURL;
        [self showQusHUDWithMessage:@"设定成功!"];
    }];
    
    UIAlertAction *drawer = [UIAlertAction actionWithTitle:@"设定抽屉栏" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        ImageModel *model = self.modelArray[indexPath.row];
        [JudgeManager defaultManager].LeftBGImg = model.thumbURL;
        [self showQusHUDWithMessage:@"设定成功!"];
    }];
    
    UIAlertAction *all = [UIAlertAction actionWithTitle:@"同时设定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        ImageModel *model = self.modelArray[indexPath.row];
        [JudgeManager defaultManager].LeftBGImg = model.thumbURL;
        [JudgeManager defaultManager].MainBGImg = model.thumbURL;
        [self showQusHUDWithMessage:@"设定成功!"];
    }];
    
    [alertVc addAction:cancle];
    [alertVc addAction:main];
    [alertVc addAction:drawer];
    [alertVc addAction:all];
    [self presentViewController:alertVc animated:YES completion:nil];
    
    
    
}

//HUD纯文字
- (void)showQusHUDWithMessage:(NSString *)msg {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    
    // Set the text mode to show only text.
    hud.mode = MBProgressHUDModeText;
    hud.label.text = msg;
    // Move to bottm center.
    hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
    
    [hud hideAnimated:YES afterDelay:2.f];
}

- (void)showSucHUDWithMessage:(NSString *)msg {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    
    // Set the custom view mode to show any view.
    hud.mode = MBProgressHUDModeCustomView;
    // Set an image view with a checkmark.
    UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    // Looks a bit nicer if we make it square.
    hud.square = YES;
    // Optional label text.
    hud.label.text = msg;
    
    [hud hideAnimated:YES afterDelay:2.f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
