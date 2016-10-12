//
//  SongListTableViewCell.h
//  ProjectB
//
//  Created by long on 16/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicListDataModels.h"
typedef void(^DownloadSongBlock)(NSInteger);

@interface SongListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *songListImageView;
@property (weak, nonatomic) IBOutlet UILabel *songListTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *songListPlayTimesLabel;
@property (weak, nonatomic) IBOutlet UILabel *songListDurationLabel;
@property (weak, nonatomic) IBOutlet UIButton *downloadBtn;

@property (nonatomic, strong) MusicListList *listModel;
@property (nonatomic, copy) DownloadSongBlock downloadSongBlock;

@end
