//
//  HotMusicTableViewCell.h
//  ProjectB
//
//  Created by long on 2016/10/13.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicHotListModel.h"
@interface HotMusicTableViewCell : UITableViewCell



@property (weak, nonatomic) IBOutlet UIImageView *musicImageView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *intro;
@property (weak, nonatomic) IBOutlet UILabel *tracksCounts;


@property (nonatomic, strong) MusicHotListModel *model;

@end
