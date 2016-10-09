//
//  NewsJokeTableViewCell.m
//  ProjectB
//
//  Created by long on 2016/10/8.
//  Copyright © 2016年 long. All rights reserved.
//

#import "NewsJokeTableViewCell.h"


@implementation NewsJokeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(NewsJokeInternalBaseClass1 *)model{
    self.contentLabel.text = model.digest;
    [self.upBtn setTitle:[NSString stringWithFormat:@"%d",(int)model.upTimes] forState:UIControlStateNormal];
    [self.downBtn setTitle:[NSString stringWithFormat:@"%d",(int)model.downTimes] forState:UIControlStateNormal];
}
- (IBAction)upBtnAction:(id)sender {
    
    if (self.upBtnBlock) {
        self.upBtnBlock();
    }
    
    
}
- (IBAction)downBtnAction:(id)sender {
    if (self.downBtnBlock) {
        self.downBtnBlock();
    }
}
- (IBAction)shareBtnAction:(id)sender {
}
@end
