//
//  IdeaTableViewCell.h
//  ProjectB
//
//  Created by 芏小川 on 2016/10/13.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IdeaTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ideaImg;
@property (weak, nonatomic) IBOutlet UILabel *ideaChoice;
@property (weak, nonatomic) IBOutlet UILabel *ideaContent;

@end
