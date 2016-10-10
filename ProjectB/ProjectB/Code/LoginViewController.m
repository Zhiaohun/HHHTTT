//
//  LoginViewController.m
//  login
//
//  Created by 芏小川 on 2016/9/27.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "UserInfoDataModels.h"

@interface LoginViewController ()

@property (nonatomic,strong) UserInfoBaseClass *base;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGRect rect = _usernameLogin.frame;
    rect.size.height = 50;
    _usernameLogin.frame = rect;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
}
#pragma mark - TapClick -
- (IBAction)registerBtn:(id)sender {
    RegisterViewController *registerVc = [RegisterViewController new];
    registerVc.backEmailBlock = ^(NSString *email){
        _usernameLogin.text = email;
    };
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:registerVc];
    navi.navigationBarHidden = NO;
    [self presentViewController:navi animated:YES completion:nil];
    
}
- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)login:(id)sender {
    
    if (!IsEmptyString(_usernameLogin.text) && !IsEmptyString(_passwordLogin.text)) {
        NSDictionary *dic = @{@"email":_usernameLogin.text,@"passwd":_passwordLogin.text};
        
        [LLNetWorkingRequest reuqestWithType:POST Controller:self URLString:URL_Login Parameter:dic Success:^(NSDictionary *dic) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                _base = [UserInfoBaseClass modelObjectWithDictionary:dic];
                
                if (_base.result == 1) {
                    [self showSucHUDWithMessage:@"登录成功!"];
                    [self performSelector:@selector(backToRoot) withObject:nil afterDelay:2.0f];
                    [JudgeManager defaultManager].isLogin = YES;
                    //保存本地信息
                    [self saveLocalUserInfo];
                }
                else{
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self showQusHUDWithMessage:@"登录失败"];
                    });
                    
                }
                
            });
        } Fail:^(NSError *error) {
            
        }];
        
    }
    else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self showQusHUDWithMessage:@"邮箱或用户名不能为空"];
        });
        
    }

    
}

- (IBAction)forgetPwd:(id)sender {
}

- (IBAction)loginInWeibo:(id)sender {
}
- (IBAction)loginInWeixin:(id)sender {
}


#pragma mark - private Method -

-(void)backToRoot{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)saveLocalUserInfo{
    UserInfoData *userData = _base.data;
    [UserInfoManager saveAuth:userData.auth UID:[NSString stringWithFormat:@"%f",userData.uid] UName:userData.uname Coverimg:userData.coverimg];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
