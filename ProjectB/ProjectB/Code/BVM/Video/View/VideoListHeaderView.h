//
//  VideoListHeaderView.h
//  ProjectB
//
//  Created by long on 2016/9/30.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^DateBtnBlock)();
typedef void(^ShareBtnBlock)();

@interface VideoListHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIView *leftBtnView2;
@property (weak, nonatomic) IBOutlet UIView *rightBtnView2;
@property (weak, nonatomic) IBOutlet UIView *leftBtnView1;
@property (weak, nonatomic) IBOutlet UIView *rightBtnView1;
@property (weak, nonatomic) IBOutlet UIView *backgroundView;

@property (nonatomic, assign) DateBtnBlock dateBtnBlock;
@property (nonatomic, assign) ShareBtnBlock shareBtnBlock;

@end
