//
//  SongPlayCommentTableViewCell.h
//  ProjectB
//
//  Created by long on 2016/10/8.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"

@interface SongPlayCommentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentContextLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentTimelabel;

@property (nonatomic, strong) CommentModel *model;
@end
