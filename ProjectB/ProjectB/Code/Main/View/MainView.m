//
//  MainView.m
//  ProjectB
//
//  Created by 芏小川 on 2016/10/12.
//  Copyright © 2016年 long. All rights reserved.
//

#import "MainView.h"

@implementation MainView



-(void)awakeFromNib
{
    [super awakeFromNib];
    self.layer.cornerRadius = 40;
    self.clipsToBounds= YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (_hideBlock) {
        _hideBlock();
    }
}


-(void)drawRect:(CGRect)rect{
    float view_height = self.frame.size.height-98-50;
    float view_width = self.frame.size.width;
    
    float start_x = 0 ;
    float start_y = 0 ;
    float width = 16;
    float height = 16;
    
    float x;
    float y;
    
    
    start_y = 50;
    NSInteger charNum;
    NSInteger containerNum;
    
    containerNum = floor(view_width/height);//一共能放几列
    charNum = floor(view_height/height);//每列几个字
    
    NSString *drawStr = _contentStr;
    NSInteger lineNum = ceil([drawStr length]/charNum);//几列
    
    start_x = view_width/2 + (lineNum-1)*16/2 ;    
    
    
    if (lineNum >= containerNum*charNum-1) {
        NSRange range;
        range.location = 0;
        range.length = containerNum*charNum-1;
        drawStr = [drawStr substringWithRange:range];
        drawStr = [drawStr stringByAppendingFormat:@"..."];
    }
    
    
    for (int i = 0; i < [drawStr length]; i ++) {
        x = start_x - floor(i/charNum)*width;
        y = start_y +(i%charNum)*height;
        CGRect Aframe = CGRectMake(x,y, width, height);
        
        //NSLog(@"frame_____%@",NSStringFromCGRect(Aframe));
        
        NSRange range;
        range.length = 1;
        range.location = i;
        NSString *str = [drawStr substringWithRange:range];
        //NSLog(@"str____%@",str);
        [str drawInRect:Aframe withFont:[UIFont systemFontOfSize:16]];
    }

}

@end
