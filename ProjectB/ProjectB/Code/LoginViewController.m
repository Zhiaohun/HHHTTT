//
//  LoginViewController.m
//  login
//
//  Created by 芏小川 on 2016/9/27.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()

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

- (IBAction)registerBtn:(id)sender {
    RegisterViewController *registerVc = [RegisterViewController new];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:registerVc];
    navi.navigationBarHidden = NO;
    [self.navigationController presentViewController:navi animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - TapClick -

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - private Method -





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
