//
//  MineEditViewController.h
//  ProjectB
//
//  Created by 芏小川 on 2016/9/29.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineEditViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *userImg;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *personalSen;

@property (nonatomic,strong) NSString *userNa;
@end
