//
//  SongMenuTableViewCell.h
//  ProjectB
//
//  Created by long on 16/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicCategoryDataModels.h"

@interface SongMenuTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *musicCategoryImageView;
@property (weak, nonatomic) IBOutlet UILabel *musicCategoryTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *musicCategoryTrackTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *musicCategoryPlaysCountsLabel;
@property (weak, nonatomic) IBOutlet UILabel *musicCategoryTracksLabel;

@property (nonatomic, strong) MusicCategoryList *listModel;
@end
