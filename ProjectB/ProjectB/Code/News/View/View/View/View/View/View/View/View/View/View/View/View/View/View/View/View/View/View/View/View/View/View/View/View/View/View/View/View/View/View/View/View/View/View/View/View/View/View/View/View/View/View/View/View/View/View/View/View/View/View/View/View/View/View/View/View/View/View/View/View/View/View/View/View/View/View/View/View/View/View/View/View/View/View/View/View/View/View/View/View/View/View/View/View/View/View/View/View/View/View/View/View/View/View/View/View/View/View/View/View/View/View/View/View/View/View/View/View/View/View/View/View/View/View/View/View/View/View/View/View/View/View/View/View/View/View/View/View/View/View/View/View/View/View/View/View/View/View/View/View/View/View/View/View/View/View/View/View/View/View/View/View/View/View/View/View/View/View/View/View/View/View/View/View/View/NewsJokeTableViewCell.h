//
//  NewsJokeTableViewCell.h
//  ProjectB
//
//  Created by long on 2016/10/8.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsJokeDataModels.h"
typedef void(^UpBtnActionBlock)();
typedef void(^DownBtnActionBlock)();
@interface NewsJokeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *upBtn;
@property (weak, nonatomic) IBOutlet UIButton *downBtn;
@property (nonatomic, strong) NewsJokeInternalBaseClass1 *model;

@property (nonatomic, copy) UpBtnActionBlock upBtnBlock;
@property (nonatomic, copy) DownBtnActionBlock downBtnBlock;

@end
