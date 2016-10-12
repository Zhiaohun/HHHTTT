//
//  TotalTableViewCell.h
//  ProjectB
//
//  Created by 芏小川 on 2016/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TotalTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *totalImg;
@property (weak, nonatomic) IBOutlet UIView *cellView;

@property (weak, nonatomic) IBOutlet UILabel *totalName;
@end
