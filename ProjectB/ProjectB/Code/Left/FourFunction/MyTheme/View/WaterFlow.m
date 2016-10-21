//
//  WaterFlow.m
//  瀑布流
//
//  Created by long on 16/8/4.
//  Copyright © 2016年 long. All rights reserved.
//

#import "WaterFlow.h"

@interface WaterFlow ()

/** 获取item的总数量 */
@property (nonatomic, assign) NSInteger numberOfItems;

/** 数组用来保存每一列的高度 */
@property (nonatomic, strong) NSMutableArray *columnHeights;

/** 用来保存每一个计算好的item的属性(point(x,y) size(width,height)) */
@property (nonatomic, strong) NSMutableArray *itemAttributes;

/** 保存每一个item的X值 */
@property (nonatomic, assign) CGFloat detalX;

/** 保存每一个item的Y值 */
@property (nonatomic, assign) CGFloat detalY;

/** 用来记录最短的列 */
@property (nonatomic, assign) NSInteger shortestIndex;


/** 获取最长列的索引 */
-(NSInteger)p_indexForLongestColumn;

/** 获取最短列的索引 */
-(NSInteger)p_indexForShortestColumn;

@end

@implementation WaterFlow

/** columnHeights数组懒加载 */
-(NSMutableArray *)columnHeights{
    if (_columnHeights == nil) {
        self.columnHeights = [NSMutableArray array];
    }
    return _columnHeights;
}

/** itemAttributes数组懒加载 */
-(NSMutableArray *)itemAttributes{
    if (_itemAttributes == nil) {
        self.itemAttributes = [NSMutableArray array];
    }
    return _itemAttributes;
}

/** 获取最长列的索引 */
-(NSInteger)p_indexForLongestColumn{
    //记录最长列
    NSInteger longIndex = 0;
    
    //记录当前最长高度
    CGFloat longHeight = 0;
    
    
    for (int i = 0; i < self.numberOfColumns; i++) {
        //获取高度
        
        CGFloat currentHeight = [self.columnHeights[i] floatValue];
        
        //判断 选出最长高度
        if (currentHeight > longHeight) {
            longHeight = currentHeight;
            longIndex = i;
        }
    }
    return longIndex;
}


-(NSInteger)p_indexForShortestColumn{
    //记录最短列
    NSInteger shortIndex = 0;
    
    //记录当前最短高度
    CGFloat shortHeight = MAXFLOAT;
    
    for (int i = 0; i < self.numberOfColumns; i++) {
               //获取高度
        NSLog(@"%d",i);
        CGFloat currentHeight = [self.columnHeights[i] floatValue];
        
        //判断 选出最短高度
        if (currentHeight < shortHeight) {
            shortHeight = currentHeight;
            shortIndex = i;
        }
    }
    return shortIndex;
}


/** 给每一添加高度 */
-(void)addHeightWithColumns{
    for (int i = 0; i < self.numberOfColumns; i++) {
      //  NSLog(@"%d.....",i);

        self.columnHeights[i] = @(self.sectionInset.top);
    }
}


/** 查找最短的列,并设置相关属性 */
-(void)searchShortColumns{
    
    self.shortestIndex = [self p_indexForShortestColumn];
    
    //接收最短列的高度
    CGFloat shortHeight = [self.columnHeights[self.shortestIndex] floatValue];
    
    //计算X值: 内边距left + (item宽 + item间距)*索引
    self.detalX = self.sectionInset.left + (self.itemSize.width + self.minimumInteritemSpacing) * self.shortestIndex;
    
    //计算Y值
    self.detalY = shortHeight + self.minimumInteritemSpacing;
}

/** 设置属性和frame */
-(void)setFrame:(NSIndexPath *)indexPath{
    // 设置属性
    UICollectionViewLayoutAttributes *layoutArr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    //保存item的高度
    CGFloat itemHeight = 0;
    if ([self.delegate respondsToSelector:@selector(heightForIndex:)]) {
        itemHeight = [self.delegate heightForIndex:indexPath];
    }
    
    //设置Frame
    layoutArr.frame = CGRectMake(self.detalX, self.detalY, self.itemSize.width, itemHeight);
    
    //放入数组
    [self.itemAttributes addObject:layoutArr];
    
    //更新高度
    self.columnHeights[self.shortestIndex] = @(self.detalY + itemHeight);
}

-(void)prepareLayout{
    [super prepareLayout];
    [self addHeightWithColumns];
    //NSLog(@"prepareLayout");
    //获取item的数量
    self.numberOfItems = [self.collectionView numberOfItemsInSection:0];
    
    //为每一个item设置frame和indexPath
    for (int i = 0; i < self.numberOfItems; i++) {
        //查找最短的列, 并设置相关属性
        [self searchShortColumns];
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [self setFrame:indexPath];
    }
}


/** 计算contentView的大小 */
-(CGSize)collectionViewContentSize{
    //先获取最长高度的索引
    NSInteger longIndex = [self p_indexForLongestColumn];
    
    //通过索引获取高度
    CGFloat longHeight = [self.columnHeights[longIndex] floatValue];
    
    //获取ContentSize
    CGSize contentSize = self.collectionView.frame.size;
    
    //设置最大高度 + 下
    contentSize.height = longHeight + self.sectionInset.bottom;
    
    return contentSize;
}

/** 返回每一个item的attribute */
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.itemAttributes;
}
@end
