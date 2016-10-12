//
//  DownloadListTableViewCell.h
//  ProjectB
//
//  Created by long on 2016/10/12.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloadModel.h"

@interface DownloadListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *songTitle;
@property (weak, nonatomic) IBOutlet UILabel *songAlbum;
@property (weak, nonatomic) IBOutlet UILabel *duration;
@property (weak, nonatomic) IBOutlet UIView *cellView;

@property (nonatomic, strong) DownloadModel *model;

@end
