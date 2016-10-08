//
//  SongListHeaderView.h
//  ProjectB
//
//  Created by long on 2016/10/7.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongListHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *songListHeaderViewImageView;
@property (weak, nonatomic) IBOutlet UILabel *songListHeaderViewTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *songListHeaderViewNickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *songListHeaderViewPlayCountsLabel;

@end
