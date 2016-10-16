//
//  VideoHeaderCollectionViewCell.m
//  ProjectB
//
//  Created by long on 2016/9/29.
//  Copyright © 2016年 long. All rights reserved.
//

#import "VideoHeaderCollectionViewCell.h"

@implementation VideoHeaderCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}


-(void)setListModel:(ItemList *)listModel{
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:listModel.data.image] placeholderImage:PlaceholderImage];
}
@end
