//
//  VideoHeaderCollectionViewCell.h
//  ProjectB
//
//  Created by long on 2016/9/29.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoCategoryDataModels.h"

@interface VideoHeaderCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (nonatomic, strong) ItemList *listModel;
@end
