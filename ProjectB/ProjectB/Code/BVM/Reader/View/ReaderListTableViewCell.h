//
//  ReaderListTableViewCell.h
//  ProjectB
//
//  Created by long on 16/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReaderListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *BookImg;
@property (weak, nonatomic) IBOutlet UILabel *BookName;
@property (weak, nonatomic) IBOutlet UILabel *BookWriter;
@property (weak, nonatomic) IBOutlet UILabel *BookScore;

@end
