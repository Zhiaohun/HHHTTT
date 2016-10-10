//
//  RegisterViewController.m
//  login
//
//  Created by 芏小川 on 2016/9/27.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "RegisterViewController.h"
#import "UserInfoModel.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

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
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    self.navigationItem.leftBarButtonItem.tintColor = [JudgeManager defaultManager].originColor;
}
-(void)goBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
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

//注册成功返回登录界面
-(void)backToLogin{
    if (self.backEmailBlock) {
        self.backEmailBlock(_phoneNumOrEmail.text);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - TapClick -
- (IBAction)register:(id)sender {

    [[UserInfoDBManager defaultManager] createTable];
    
    if(IsEmptyString(_phoneNumOrEmail.text) || IsEmptyString(_password.text) || IsEmptyString(_username.text)){
        
        [self showQusHUDWithMessage:@"您填写的信息不完整!"];
    }
    else if (_password.text.length < 6){
        [self showQusHUDWithMessage:@"密码长度不能少于六位"];
    }
    else{
        //网络请求
        NSDictionary *dic = @{@"email":_phoneNumOrEmail.text,@"uname":_username.text,@"passwd":_password.text};
        [LLNetWorkingRequest reuqestWithType:POST Controller:self URLString:URL_Register Parameter:dic Success:^(NSDictionary *dic) {
            
            NSNumber *result = dic[@"result"];
            if ([result integerValue] == 1) {
                UserInfoModel *model = [UserInfoModel new];
                model.username = _username.text;
                [[UserInfoDBManager defaultManager] insertDataWithModel:model]; 
                //注册成功
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self showSucHUDWithMessage:@"注册成功"];
                    [self performSelector:@selector(backToLogin) withObject:nil afterDelay:2];
                });
            }
            else{
                //注册失败
                NSDictionary *dataDic = dic[@"data"];
                NSString *msg = dataDic[@"msg"];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self showQusHUDWithMessage:msg];
                });
            }
        } Fail:^(NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self showSucHUDWithMessage:@"请求注册数据失败!"];
            });
            
        }];

    }

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
