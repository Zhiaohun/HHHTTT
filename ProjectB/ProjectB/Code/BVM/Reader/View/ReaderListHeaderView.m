//
//  ReaderListHeaderView.m
//  ProjectB
//
//  Created by 芏小川 on 2016/10/6.
//  Copyright © 2016年 long. All rights reserved.
//

#import "ReaderListHeaderView.h"

@implementation ReaderListHeaderView

- (IBAction)Motivation:(id)sender {
    [self getColor];
    [self.movition setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.BookTypeLb.text = @"励志";
    [self useBlock];
    
}
- (IBAction)Psychology:(id)sender {
    [self getColor];
    [self.psychology setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.BookTypeLb.text = @"心理学";
    [self useBlock];
    
}
- (IBAction)novel:(id)sender {
    [self getColor];
    [self.novel setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.BookTypeLb.text = @"小说";
    [self useBlock];
}
- (IBAction)Art:(id)sender {
    [self getColor];
    [self.art setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.BookTypeLb.text = @"文艺";
    [self useBlock];
}

#pragma mark - private Method -
-(void)getColor{

    [self.movition setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.psychology setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.novel setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.art setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
}

-(void)useBlock{
    if (_toTypeBlock) {
        _toTypeBlock(self.BookTypeLb.text);
    }
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
