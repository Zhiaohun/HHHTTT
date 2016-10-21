//
//  CollectionViewCell.m
//  瀑布流
//
//  Created by long on 16/8/4.
//  Copyright © 2016年 long. All rights reserved.
//

#import "CollectionViewCell.h"
@implementation CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setModel:(ImageModel *)model{
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.thumbURL]];
}
@end
