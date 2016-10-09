//
//  NewsImageMoreTableViewCell.h
//  ProjectB
//
//  Created by long on 2016/9/28.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsTechnologyDataModels.h"
#import "NewsEntertainmentDataModels.h"
#import "NewsGameDataModels.h"
#import "NewsConcentrationDataModels.h"

@interface NewsImageMoreTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;
@property (weak, nonatomic) IBOutlet UILabel *scourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;

@property (nonatomic, strong) NewsTechnologyT1348649580692 *tmodel;
@property (nonatomic, strong) NewsEntertainmentT1348648517839 *emodel;
@property (nonatomic, strong) NewsGameT1348654151579 *gmodel;
@property (nonatomic, strong) NewsConcentrationT1467284926140 *cmodel;

@end
