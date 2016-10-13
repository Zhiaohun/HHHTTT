//
//  HotListTableViewCell.h
//  ProjectB
//
//  Created by 芏小川 on 2016/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *requestMoreBtn;

@property (weak, nonatomic) IBOutlet UILabel *viewTitle;
@property (weak, nonatomic) IBOutlet UIImageView *headImg;

@property (weak, nonatomic) IBOutlet UIImageView *view1Img;
@property (weak, nonatomic) IBOutlet UILabel *view1Title;
@property (weak, nonatomic) IBOutlet UILabel *view1scoreLb;

@property (weak, nonatomic) IBOutlet UIImageView *view2Img;
@property (weak, nonatomic) IBOutlet UILabel *view2Title;
@property (weak, nonatomic) IBOutlet UILabel *view2Score;

@property (weak, nonatomic) IBOutlet UIImageView *view3Img;
@property (weak, nonatomic) IBOutlet UILabel *view3Title;
@property (weak, nonatomic) IBOutlet UILabel *view3Score;



@end
