//
//  MyselfPageViewController.m
//  ProjectB
//
//  Created by 芏小川 on 2016/9/29.
//  Copyright © 2016年 long. All rights reserved.
//

#import "MyselfPageViewController.h"
#import "DWSwipeGestures.h"
#import "UIViewController+XHPhoto.h"
#import "UserInfoDBManager.h"

@interface MyselfPageViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *selfImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UITextField *personal;
@property (weak, nonatomic) IBOutlet UILabel *sex;
@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UILabel *birth;

@end

@implementation MyselfPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initUI];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private Method -
-(void)initUI{
    
    _username.text = [UserInfoManager getUname];
    UserInfoModel *model = [[UserInfoDBManager defaultManager] selectDataWithUsername:[NSString stringWithFormat:@"%@",_username.text]];
    _personalSen.text = model.personalSentence;
    
    [JudgeManager defaultManager].currentAbsract = model.personalSentence;
    
    self.userImg.layer.cornerRadius = 50;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(editBack)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveBack)];
    self.navigationItem.leftBarButtonItem.tintColor = [JudgeManager defaultManager].originColor;
    self.navigationItem.rightBarButtonItem.tintColor = [JudgeManager defaultManager].originColor;
    
    
    //为图片添加手势,调取系统相册
    
    DWSwipeGestures *gestures = [[DWSwipeGestures alloc] init];
    [gestures dw_SwipeGestureType:DWTapGesture Target:self Action:@selector(getImageForIcon) AddView:self.selfImageView BackSwipeGestureTypeString:^(NSString * _Nonnull backSwipeGestureTypeString) {
        NSLog(@"%@",backSwipeGestureTypeString);
    }];
}
-(void)editBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)saveBack{

    [[UserInfoDBManager defaultManager] updateWithUsername:_username.text TOPersonalSten:_personalSen.text userImg:nil gender:nil city:nil birthday:nil];
    
    UserInfoModel *model = [[UserInfoDBManager defaultManager] selectDataWithUsername:[NSString stringWithFormat:@"%@",_username.text]];
    [JudgeManager defaultManager].currentAbsract = model.personalSentence;
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)getImageForIcon{
/*
    NSLog(@">>>>>>>>>>");
    UIImagePickerController *pickerImageVC = [[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        //pickerImageVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        pickerImageVC.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
       // pickerImageVC.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImageVC.sourceType];
        
    }
    pickerImageVC.delegate = self;
    pickerImageVC.allowsEditing = NO;
    [self presentViewController:pickerImageVC animated:YES completion:nil];
    
 */
    
    /*
    [self showCanEdit:YES photo:^(UIImage *photo) {
       self.selfImageView.image = photo;
        
        UserInfoDBManager *manager = [UserInfoDBManager defaultManager];
        
        NSData *data = UIImagePNGRepresentation(self.selfImageView.image);
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        [manager updateWithUsername:self.nickName.text TOPersonalSten:self.personal.text userImg:str gender:self.sex.text city:self.city.text birthday:self.birth.text];

    }];
     */

}


/*
//点击相册中的图片 货照相机照完后点击use  后触发的方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.selfImageView.image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

//点击cancel 调用的方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
*/
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
