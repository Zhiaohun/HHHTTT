//
//  ReaderListHeaderView.h
//  ProjectB
//
//  Created by 芏小川 on 2016/10/6.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ToTypeBlock)(NSString *);

@interface ReaderListHeaderView : UIView
@property (weak, nonatomic) IBOutlet UILabel *BookTypeLb;
@property (weak, nonatomic) IBOutlet UIButton *movition;
@property (weak, nonatomic) IBOutlet UIButton *psychology;
@property (weak, nonatomic) IBOutlet UIButton *novel;
@property (weak, nonatomic) IBOutlet UIButton *art;

@property (weak, nonatomic) IBOutlet UIView *cutline;


@property (nonatomic,strong) ToTypeBlock toTypeBlock;

@end
