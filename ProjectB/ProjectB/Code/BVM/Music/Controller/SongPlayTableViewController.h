//
//  SongPlayTableViewController.h
//  ProjectB
//
//  Created by long on 2016/10/8.
//  Copyright © 2016年 long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicListDataModels.h"

@interface SongPlayTableViewController : UITableViewController

//@property (nonatomic, strong) MusicListList *listModel;
@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, strong) NSMutableArray *musicListArray;
@end
