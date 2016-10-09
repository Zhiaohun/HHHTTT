//
//  NewsImageTableViewCell.m
//  ProjectB
//
//  Created by long on 2016/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import "NewsImageTableViewCell.h"

@implementation NewsImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setTmodel:(NewsTechnologyT1348649580692 *)tmodel{
    self.titleLabel.text = tmodel.title;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:tmodel.imgsrc] placeholderImage:PlaceholderImage];
    self.sourceLabel.text = tmodel.source;
    self.priorityLabel.text = [NSString stringWithFormat:@"%d贴",(int)tmodel.priority];
}


-(void)setEmodel:(NewsEntertainmentT1348648517839 *)emodel{
    self.titleLabel.text = emodel.title;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:emodel.imgsrc] placeholderImage:PlaceholderImage];
    self.sourceLabel.text = emodel.source;
    self.priorityLabel.text = [NSString stringWithFormat:@"%d贴",(int)emodel.priority];
}



-(void)setGmodel:(NewsGameT1348654151579 *)gmodel{
    self.titleLabel.text = gmodel.title;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:gmodel.imgsrc] placeholderImage:PlaceholderImage];
    self.sourceLabel.text = gmodel.source;
    self.priorityLabel.text = [NSString stringWithFormat:@"%d贴",(int)gmodel.priority];
}

-(void)setCmodel:(NewsConcentrationT1467284926140 *)cmodel{
    self.titleLabel.text = cmodel.title;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:cmodel.imgsrc] placeholderImage:PlaceholderImage];
    self.sourceLabel.text = cmodel.source;
    self.priorityLabel.text = [NSString stringWithFormat:@"%d贴",(int)cmodel.priority];
}
@end
