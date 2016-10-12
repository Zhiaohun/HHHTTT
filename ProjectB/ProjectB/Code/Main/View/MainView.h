//
//  MainView.h
//  ProjectB
//
//  Created by 芏小川 on 2016/10/12.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainView : UIView


@property (weak, nonatomic) IBOutlet UILabel *realContentLb;
@property (weak, nonatomic) IBOutlet UIImageView *bigImg;
@property (weak, nonatomic) IBOutlet UIImageView *rollImg;

@property (nonatomic,strong) NSString *contentStr;

@property (weak, nonatomic) IBOutlet UILabel *tip;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *collection;
@property (weak, nonatomic) IBOutlet UILabel *from;
@property (weak, nonatomic) IBOutlet UILabel *onlytxt;

@end
