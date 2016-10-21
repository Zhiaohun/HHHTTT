//
//  CollectionViewCell.h
//  瀑布流
//
//  Created by long on 16/8/4.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageModel.h"

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (nonatomic, strong) ImageModel *model;;

@end
