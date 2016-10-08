//
//  ReaderDetailViewController.h
//  ProjectB
//
//  Created by long on 16/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReaderDetailViewController : UIViewController

@property (nonatomic,strong) NSString *productID;
@property (nonatomic,strong) NSString *abstract;
@property (nonatomic,strong) NSString *imgUrl;

@property (weak, nonatomic) IBOutlet UIImageView *bookImg;
@property (weak, nonatomic) IBOutlet UITextView *bookAbstract;

@property (weak, nonatomic) IBOutlet UIView *baseView;

@end
