//
//  LYScrollView.h
//  Demo
//
//  Created by 志恒李-ly on 16/9/2.
//  Copyright © 2016年 志恒李. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainDataModels.h"
#import "MainView.h"
typedef void(^RefreshBlock)();
@protocol BeginRefresh <NSObject>

-(void)beginRefresh;

@end

@protocol LYScrollViewDelegate <NSObject>

- (void)scrolIndex:(NSInteger)index;

@end

@interface LYScrollView : UIView

@property (nonatomic, weak) id <LYScrollViewDelegate>delegate;

@property (nonatomic, strong) NSMutableArray * itmeArray;

@property (nonatomic, assign) BOOL isOpenDelete;//开启⬆️滑删除
@property (nonatomic,strong) MainBaseClass *mainBase;

@property (nonatomic,strong) MainView *view;
@property (nonatomic,copy) RefreshBlock refreshBlock;
@property (nonatomic,assign) id<BeginRefresh> setdelegate;
@property (nonatomic,strong) SwiftHUD *swifthud;

@end
