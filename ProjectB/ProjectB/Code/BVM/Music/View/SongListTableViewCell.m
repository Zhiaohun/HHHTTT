//
//  SongListTableViewCell.m
//  ProjectB
//
//  Created by long on 16/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import "SongListTableViewCell.h"

@implementation SongListTableViewCell



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setListModel:(MusicListList *)listModel{
    [self.songListImageView sd_setImageWithURL:[NSURL URLWithString:listModel.coverMiddle] placeholderImage:PlaceholderImage];
    self.songListImageView.layer.cornerRadius = 25;
    self.songListImageView.layer.masksToBounds = YES;
    self.songListImageView.layer.borderWidth = 3;
    self.songListImageView.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.songListImageView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.songListImageView.layer.shadowOffset = CGSizeMake(0, 0);
    self.songListImageView.layer.shadowOpacity = 0.5;
    
    self.songListTitleLabel.text = listModel.title;
    self.songListPlayTimesLabel.text = [NSString stringWithFormat:@"%d",(int)listModel.playtimes];
    self.songListDurationLabel.text = [NSString stringWithFormat:@"%02d:%02d",(int)listModel.duration/60,(int)listModel.duration%60];
    
    
}
- (IBAction)downloadBtnAction:(id)sender {
    UIButton *btn = (UIButton *)sender;
    if (self.downloadSongBlock) {
        self.downloadSongBlock(btn.tag);
    }
}


@end
