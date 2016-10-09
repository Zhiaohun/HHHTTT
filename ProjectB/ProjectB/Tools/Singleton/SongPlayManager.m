//
//  SongPlayManager.m
//  ProjectB
//
//  Created by long on 2016/10/9.
//  Copyright © 2016年 long. All rights reserved.
//

#import "SongPlayManager.h"
#import "MusicListDataModels.h"


@interface SongPlayManager()



@end

@implementation SongPlayManager


+(instancetype)defaultManager{
    static SongPlayManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[SongPlayManager alloc] init];
    });
    return manager;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        _songArray = [NSMutableArray array];
    }
    return self;
}

-(void)setSongArray:(NSMutableArray *)songArray{
    
    MusicListList *listModel = songArray[self.index];
    AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:listModel.playUrl64]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playComplete) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
    
    if (_player) {
        [_player replaceCurrentItemWithPlayerItem:item];
    }else{
        _player = [[AVPlayer alloc] initWithPlayerItem:item];
    }
    _songArray = songArray;
}


-(void)playComplete{
    [self nextSong];
}
//播放
-(void)playSong{
    [_player play];
    _isPlay = YES;
}
//暂停
-(void)pauseSong{
    [_player pause];
    _isPlay = NO;
}

//下一首
-(void)nextSong{
  
    
    if (self.index == self.songArray.count - 1) {
        self.index = 0;
    }else{
        self.index++;
    }
    [self changeSong];
    [_player play];
}

//上一首
-(void)lastSong{
    if (self.index == 0) {
        self.index = self.songArray.count - 1;
    }else{
        self.index--;
    }
    
    [self changeSong];
    [_player play];
}

//跳到指定时间播放
-(void)seekToTime:(CGFloat)seconds{
    
    [_player pause];
    CMTime newTime = CMTimeMakeWithSeconds(seconds, _player.currentTime.timescale);
    [_player seekToTime:newTime];
    [_player play];
}

-(void)changeSong{
    MusicListList *listModel = self.songArray[_index];
    
    AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:listModel.playUrl64]];
    [_player replaceCurrentItemWithPlayerItem:item];
    
}

-(void)getSong:(NSInteger)index{
    _index = index;
    [self changeSong];
    [_player play];
}

- (void)playerProgressWithProgressFloat:(CGFloat)progressFloat
{
    [self.player seekToTime:CMTimeMakeWithSeconds(progressFloat, 1) completionHandler:^(BOOL finished) {
        [_player play];
    }];
}


//当前时间
-(CGFloat)currentTime{
    
    CGFloat time = _player.currentTime.value / _player.currentTime.timescale;
    return time;
}
//总时间
-(CGFloat)totalTime{
    if (_player.currentItem.duration.timescale == 0) {
        return 0;
    }
    
    CGFloat time = _player.currentItem.duration.value / _player.currentItem.duration.timescale;
    return time;
}

@end
