//
//  MusicPlayHeaderView.h
//  ProjectB
//
//  Created by long on 2016/10/8.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^SongPlayBlock)();
typedef void(^SongNextBlock)();
typedef void(^SongLastBlock)();
typedef void(^SeekToTimeBlock)();

@interface MusicPlayHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *musicPlayImageView;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *musicPlayTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *musicPlayPlayTimesLabel;
@property (weak, nonatomic) IBOutlet UILabel *musicPlayCreatedTimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UIButton *lastBtn;

@property (nonatomic, copy) SongPlayBlock songPlayBlock;
@property (nonatomic, copy) SongNextBlock songNextBlock;
@property (nonatomic, copy) SongLastBlock songLastBlock;
@property (nonatomic, copy) SeekToTimeBlock seekToTimeBlock;

@end
