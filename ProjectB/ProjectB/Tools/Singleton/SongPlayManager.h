//
//  SongPlayManager.h
//  ProjectB
//
//  Created by long on 2016/10/9.
//  Copyright © 2016年 long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SongPlayManager : NSObject

+(instancetype)defaultManager;


@property (nonatomic, strong) NSMutableArray *songArray;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) BOOL isPlay;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, assign) CGFloat currentTime;
@property (nonatomic, assign) CGFloat totalTime;

//播放
-(void)playSong;
//暂停
-(void)pauseSong;
//下一首
-(void)nextSong;
//上一首
-(void)lastSong;

//跳到指定时间播放
-(void)seekToTime:(CGFloat)seconds;

//得到指定歌曲
-(void)getSong:(NSInteger)index;

//当前时间
-(CGFloat)currentTime;
//总时间
-(CGFloat)totalTime;

- (void)playerProgressWithProgressFloat:(CGFloat)progressFloat;
@end
