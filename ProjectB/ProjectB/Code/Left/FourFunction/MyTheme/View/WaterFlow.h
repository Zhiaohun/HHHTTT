//
//  WaterFlow.h
//  瀑布流
//
//  Created by long on 16/8/4.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WaterFlowDelegate <NSObject>

/** 获取item的高度 */
-(CGFloat)heightForIndex:(NSIndexPath *)indexPath;

@end

@interface WaterFlow : UICollectionViewLayout

/** item的大小 */
@property (nonatomic, assign) CGSize itemSize;

/** 内边距 */
@property (nonatomic, assign) UIEdgeInsets sectionInset;

/** 列间距 */
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;

/** 行间距 */
@property (nonatomic, assign) CGFloat minimumLineSpacing;

/** 列数 */
@property (nonatomic, assign) NSInteger numberOfColumns;

/** 代理 */
@property (nonatomic, assign) id<WaterFlowDelegate> delegate;

@end
