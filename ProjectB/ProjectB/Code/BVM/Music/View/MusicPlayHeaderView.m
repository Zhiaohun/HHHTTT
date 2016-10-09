//
//  MusicPlayHeaderView.m
//  ProjectB
//
//  Created by long on 2016/10/8.
//  Copyright © 2016年 long. All rights reserved.
//

#import "MusicPlayHeaderView.h"
#import "SongPlayManager.h"

@implementation MusicPlayHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)playBtnAction:(id)sender {

    if (self.songPlayBlock) {
        self.songPlayBlock();
    }
    
}
- (IBAction)nextBtnAction:(id)sender {
    if (self.songNextBlock) {
        self.songNextBlock();
        
    }
}
- (IBAction)lastBtnAction:(id)sender {
    
    if (self.songLastBlock) {
        self.songLastBlock();
    }
}

- (IBAction)sliderAction:(id)sender {
    if (self.seekToTimeBlock) {
        self.seekToTimeBlock();
    }
    
    //[[SongPlayManager defaultManager] playerProgressWithProgressFloat:((UISlider*)sender).value];
}


@end
