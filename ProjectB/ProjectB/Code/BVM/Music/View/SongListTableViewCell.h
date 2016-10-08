//
//  SongListTableViewCell.h
//  ProjectB
//
//  Created by long on 16/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicListDataModels.h"

@interface SongListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *songListImageView;
@property (weak, nonatomic) IBOutlet UILabel *songListTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *songListPlayTimesLabel;
@property (weak, nonatomic) IBOutlet UILabel *songListDurationLabel;

@property (nonatomic, strong) MusicListList *listModel;

@end
