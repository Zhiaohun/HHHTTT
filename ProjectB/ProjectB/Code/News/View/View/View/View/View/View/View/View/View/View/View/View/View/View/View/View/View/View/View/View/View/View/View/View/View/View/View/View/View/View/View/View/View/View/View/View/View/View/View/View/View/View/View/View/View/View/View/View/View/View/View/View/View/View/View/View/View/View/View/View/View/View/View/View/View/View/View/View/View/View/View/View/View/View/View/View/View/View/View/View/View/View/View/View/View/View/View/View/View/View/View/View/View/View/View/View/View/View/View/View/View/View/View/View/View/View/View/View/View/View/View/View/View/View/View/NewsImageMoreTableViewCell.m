//
//  NewsImageMoreTableViewCell.m
//  ProjectB
//
//  Created by long on 2016/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import "NewsImageMoreTableViewCell.h"

@implementation NewsImageMoreTableViewCell

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
    [self.imageView1 sd_setImageWithURL:[NSURL URLWithString:tmodel.imgsrc] placeholderImage:PlaceholderImage];
    NSLog(@"%lu",tmodel.imgextra.count);
   [self.imageView2 sd_setImageWithURL:[NSURL URLWithString:[tmodel.imgextra[0] imgsrc]] placeholderImage:PlaceholderImage];
   [self.imageView3 sd_setImageWithURL:[NSURL URLWithString:[tmodel.imgextra[1] imgsrc]] placeholderImage:PlaceholderImage];
    self.scourceLabel.text = tmodel.source;
    self.priorityLabel.text = [NSString stringWithFormat:@"%d贴",(int)tmodel.priority];
}

-(void)setEmodel:(NewsEntertainmentT1348648517839 *)emodel{
    self.titleLabel.text = emodel.title;
    [self.imageView1 sd_setImageWithURL:[NSURL URLWithString:emodel.imgsrc] placeholderImage:PlaceholderImage];
    NSLog(@"%lu",emodel.imgextra.count);
    [self.imageView2 sd_setImageWithURL:[NSURL URLWithString:[emodel.imgextra[0] imgsrc]] placeholderImage:PlaceholderImage];
    [self.imageView3 sd_setImageWithURL:[NSURL URLWithString:[emodel.imgextra[1] imgsrc]] placeholderImage:PlaceholderImage];
    self.scourceLabel.text = emodel.source;
    self.priorityLabel.text = [NSString stringWithFormat:@"%d贴",(int)emodel.priority];
}


-(void)setGmodel:(NewsGameT1348654151579 *)gmodel{
    self.titleLabel.text = gmodel.title;
    [self.imageView1 sd_setImageWithURL:[NSURL URLWithString:gmodel.imgsrc] placeholderImage:PlaceholderImage];
    NSLog(@"%lu",gmodel.imgextra.count);
    [self.imageView2 sd_setImageWithURL:[NSURL URLWithString:[gmodel.imgextra[0] imgsrc]] placeholderImage:PlaceholderImage];
    [self.imageView3 sd_setImageWithURL:[NSURL URLWithString:[gmodel.imgextra[1] imgsrc]] placeholderImage:PlaceholderImage];
    self.scourceLabel.text = gmodel.source;
    self.priorityLabel.text = [NSString stringWithFormat:@"%d贴",(int)gmodel.priority];
   
}

-(void)setCmodel:(NewsConcentrationT1467284926140 *)cmodel{
    self.titleLabel.text = cmodel.title;
    [self.imageView1 sd_setImageWithURL:[NSURL URLWithString:cmodel.imgsrc] placeholderImage:PlaceholderImage];
    NSLog(@"%lu",cmodel.imgextra.count);
    [self.imageView2 sd_setImageWithURL:[NSURL URLWithString:[cmodel.imgextra[0] imgsrc]] placeholderImage:PlaceholderImage];
    [self.imageView3 sd_setImageWithURL:[NSURL URLWithString:[cmodel.imgextra[1] imgsrc]] placeholderImage:PlaceholderImage];
    self.scourceLabel.text = cmodel.source;
    self.priorityLabel.text = [NSString stringWithFormat:@"%d贴",(int)cmodel.priority];

}
@end
