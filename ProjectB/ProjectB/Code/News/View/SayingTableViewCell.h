//
//  SayingTableViewCell.h
//  ProjectB
//
//  Created by long on 2016/10/10.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsSayingModel.h"
typedef void(^UpBtnActionBlock)();
typedef void(^DownBtnActionBlock)();
typedef void(^ShareBtnActionBlock)();
@interface SayingTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *sayingImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *upBtn;
@property (weak, nonatomic) IBOutlet UIButton *downBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (weak, nonatomic) IBOutlet UIView *cellView;

@property (nonatomic, strong) NewsSayingModel *model;


@property (nonatomic, copy) UpBtnActionBlock upBtnActionBlock;
@property (nonatomic, copy) DownBtnActionBlock downBtnActionBlock;
@property (nonatomic, copy) ShareBtnActionBlock shareBtnActionBlock;
@end
