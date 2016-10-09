//
//  SongPlayCommentTableViewCell.m
//  ProjectB
//
//  Created by long on 2016/10/8.
//  Copyright © 2016年 long. All rights reserved.
//

#import "SongPlayCommentTableViewCell.h"

@implementation SongPlayCommentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setModel:(CommentModel *)model{
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:model.smallHeader] placeholderImage:PlaceholderImage];
    self.userImageView.layer.masksToBounds = YES;
    self.userImageView.layer.cornerRadius = 27;
    
    self.userNickNameLabel.text = model.nickname;
   // NSString *commentStr = [self stringContainsEmoji:model.content];
    self.commentContextLabel.text = model.content;
    
    NSString *timeStr = [NSString stringWithFormat:@"%f",model.updatedAt];
    self.commentTimelabel.text = [self timeWithTimeIntervalString:timeStr];
}

- (NSString *)timeWithTimeIntervalString:(NSString *)timeString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}


@end
