//
//  SongMenuTableViewCell.m
//  ProjectB
//
//  Created by long on 16/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import "SongMenuTableViewCell.h"

@implementation SongMenuTableViewCell



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setListModel:(MusicCategoryList *)listModel{
    [self.musicCategoryImageView sd_setImageWithURL:[NSURL URLWithString:listModel.albumCoverUrl290] placeholderImage:PlaceholderImage];
    
    self.musicCategoryImageView.layer.borderWidth = 3;
    self.musicCategoryImageView.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.musicCategoryImageView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.musicCategoryImageView.layer.shadowOffset = CGSizeMake(1, 1);
    self.musicCategoryImageView.layer.shadowOpacity = 0.5;
    
  
    
    self.musicCategoryTitleLabel.text = listModel.title;
    self.musicCategoryTrackTitleLabel.text = listModel.trackTitle;
    self.musicCategoryPlaysCountsLabel.text = [NSString stringWithFormat:@"%d",(int)listModel.playsCounts];
    self.musicCategoryTracksLabel.text = [NSString stringWithFormat:@"%d集",(int)listModel.tracks];
    
}

@end
