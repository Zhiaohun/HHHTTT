//
//  MineViewController.h
//  ProjectB
//
//  Created by 芏小川 on 2016/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UIView *unLoginView;
@property (weak, nonatomic) IBOutlet UIImageView *unLoginImg;


@property (weak, nonatomic) IBOutlet UIView *LoginView;
@property (weak, nonatomic) IBOutlet UIView *LoginImg;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *personalSentence;


@property (weak, nonatomic) IBOutlet UITableView *systemInfoTableView;
@property (weak, nonatomic) IBOutlet UIView *signOutView;




@end
