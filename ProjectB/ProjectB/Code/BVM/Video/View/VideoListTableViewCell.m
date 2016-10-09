//
//  VideoListTableViewCell.m
//  ProjectB
//
//  Created by long on 2016/9/30.
//  Copyright © 2016年 long. All rights reserved.
//

#import "VideoListTableViewCell.h"

@implementation VideoListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setListModel:(VideoListItemList *)listModel{
    [self.videoImageView sd_setImageWithURL:[NSURL URLWithString:listModel.data.cover.feed] placeholderImage:PlaceholderImage];
    self.titleLabel.text = listModel.data.title;
    
    NSString *time = [NSString stringWithFormat:@"%02d'%02d''",(int)listModel.data.duration / 60,(int)listModel.data.duration % 60];
    self.descLabel.text = [NSString stringWithFormat:@"#%@ / %@",listModel.data.category,time];
    if (IsEmptyString(listModel.data.title)) {
        self.label360.text = listModel.data.label.text;
    }else{
        self.label360.hidden = YES;
    }
}
@end
