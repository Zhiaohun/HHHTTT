//
//  DownloadDBManager.h
//  ProjectB
//
//  Created by 芏小川 on 2016/10/8.
//  Copyright © 2016年 long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "DownloadModel.h"

@interface DownloadDBManager : NSObject

@property (nonatomic, strong) FMDatabase *db;

+(instancetype)defaultManager;

-(void)createTable;

-(void)insertSongWithModel:(DownloadModel *)model;

-(void)deleteSongWithSongName:(NSString *)songName;

-(NSArray<DownloadModel *> *)selectAllSong;






@end
