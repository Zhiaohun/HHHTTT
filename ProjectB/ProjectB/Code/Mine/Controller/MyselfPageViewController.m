//
//  MyselfPageViewController.m
//  ProjectB
//
//  Created by 芏小川 on 2016/9/29.
//  Copyright © 2016年 long. All rights reserved.
//

#import "MyselfPageViewController.h"

@interface MyselfPageViewController ()

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



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
