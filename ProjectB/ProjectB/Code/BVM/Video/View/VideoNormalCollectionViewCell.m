//
//  VideoNormalCollectionViewCell.m
//  ProjectB
//
//  Created by long on 2016/9/29.
//  Copyright © 2016年 long. All rights reserved.
//

#import "VideoNormalCollectionViewCell.h"

@implementation VideoNormalCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setListModel:(ItemList *)listModel{
    self.normalTitleLabel.text = listModel.data.title;
    [self.normalImageView sd_setImageWithURL:[NSURL URLWithString:listModel.data.image] placeholderImage:PlaceholderImage];
}
@end
