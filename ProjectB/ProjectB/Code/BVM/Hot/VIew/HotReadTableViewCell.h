//
//  HotReadTableViewCell.h
//  ProjectB
//
//  Created by 芏小川 on 2016/10/13.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotReadTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *rankLb;
@property (weak, nonatomic) IBOutlet UIImageView *bookImg;
@property (weak, nonatomic) IBOutlet UILabel *bookName;
@property (weak, nonatomic) IBOutlet UILabel *bookWriter;
@property (weak, nonatomic) IBOutlet UILabel *bookPrint;
@property (weak, nonatomic) IBOutlet UILabel *bookComment;
@property (weak, nonatomic) IBOutlet UILabel *bookIntroduce;

@end
