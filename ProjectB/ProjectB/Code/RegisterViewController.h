//
//  RegisterViewController.h
//  login
//
//  Created by 芏小川 on 2016/9/27.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BackEmailBlock)(NSString *);
@interface RegisterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumOrEmail;


@property (nonatomic,copy)BackEmailBlock backEmailBlock;
@end
