//
//  VideoListHeaderView.m
//  ProjectB
//
//  Created by long on 2016/9/30.
//  Copyright © 2016年 long. All rights reserved.
//

#import "VideoListHeaderView.h"

@implementation VideoListHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (IBAction)leftBtnAction:(id)sender {
    self.rightBtnView1.hidden = YES;
    self.rightBtnView2.hidden = YES;
    self.leftBtnView1.hidden = NO;
    self.leftBtnView2.hidden = NO;
    
    if (self.dateBtnBlock) {
        self.dateBtnBlock();
    }
}
- (IBAction)rightBtnAction:(id)sender {
    self.leftBtnView1.hidden = YES;
    self.leftBtnView2.hidden = YES;
    self.rightBtnView1.hidden = NO;
    self.rightBtnView2.hidden = NO;
    
    if (self.shareBtnBlock) {
        self.shareBtnBlock();
    }
}

@end
