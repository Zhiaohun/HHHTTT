//
//  DownloadListTableViewCell.m
//  ProjectB
//
//  Created by long on 2016/10/12.
//  Copyright © 2016年 long. All rights reserved.
//

#import "DownloadListTableViewCell.h"

@implementation DownloadListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setModel:(DownloadModel *)model{
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.imageURL]];
    self.songTitle.text = model.songName;
    self.songAlbum.text = model.albumTitle;
    self.duration.text = [NSString stringWithFormat:@"%d'%d''",[model.songDuration intValue] / 60,[model.songDuration intValue] % 60];
    
}
@end
