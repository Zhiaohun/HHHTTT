//
//  SayingTableViewCell.m
//  ProjectB
//
//  Created by long on 2016/10/10.
//  Copyright © 2016年 long. All rights reserved.
//

#import "SayingTableViewCell.h"

@implementation SayingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(NewsSayingModel *)model{
    [self.sayingImageView sd_setImageWithURL:[NSURL URLWithString:model.profile_image_url] placeholderImage:PlaceholderImage];
    self.userNameLabel.text = model.screen_name;
    self.timeLabel.text = model.behot_time_str;
    self.contentLabel.text = model.content;
    self.commentCountLabel.text = [NSString stringWithFormat:@"评论%d",(int)model.comment_count];
    [self.upBtn setTitle:[NSString stringWithFormat:@"%d",(int)model.digg_count] forState:UIControlStateNormal];
    [self.downBtn setTitle:[NSString stringWithFormat:@"%d",(int)model.bury_count] forState:UIControlStateNormal];
}
- (IBAction)upBtnAction:(id)sender {
    
    if (self.upBtnActionBlock) {
        self.upBtnActionBlock();
        
    }
}
- (IBAction)downBtnAction:(id)sender {
    
    if (self.downBtnActionBlock) {
        self.downBtnActionBlock();
        
    }
}
- (IBAction)shareBtnAction:(id)sender {
    
    if (self.shareBtnActionBlock) {
        self.shareBtnActionBlock();
        
    }
}

@end
