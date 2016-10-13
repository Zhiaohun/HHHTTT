//
//  HotMusicTableViewCell.m
//  ProjectB
//
//  Created by long on 2016/10/13.
//  Copyright © 2016年 long. All rights reserved.
//

#import "HotMusicTableViewCell.h"

@implementation HotMusicTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(MusicHotListModel *)model{
    
    [self.musicImageView sd_setImageWithURL:[NSURL URLWithString:model.coverMiddle] placeholderImage:PlaceholderImage];
    self.musicTitle.text = model.title;
    self.musicIntro.text = model.intro;
    self.musicTracksCounts.text = [NSString stringWithFormat:@"%d集",(int)model.tracksCounts];
    
}
@end
