//
//  DownloadDBManager.m
//  ProjectB
//
//  Created by 芏小川 on 2016/10/8.
//  Copyright © 2016年 long. All rights reserved.
//

#import "DownloadDBManager.h"

@implementation DownloadDBManager

+(instancetype)defaultManager{
    static DownloadDBManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DownloadDBManager alloc] init];
    });
    return manager;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        NSString *pathDB = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/SongDownload.sqlite"];
        NSLog(@"________%@",pathDB);
        self.db = [FMDatabase databaseWithPath:pathDB];
        if (!self.db) {
            NSLog(@"SongDownload数据库打开失败!");
        }
    }
    
    return self;
}

-(void)createTable{
    [self.db open];
    NSString *sqlStr = @"create table if not exists SongDownload(songName text,songDuration text,imageURL text,path text,albumTitle text)";
    BOOL result = [self.db executeUpdate:sqlStr];
    if (result) {
        NSLog(@"创建表成功");
    }
    else{
        NSLog(@"创建表失败");
    }
    
    [self.db close];
    
}

-(void)insertSongWithModel:(DownloadModel *)model{
    
    [self.db open];
    
    NSString *sqlStr = [NSString stringWithFormat:@"insert into SongDownload(songName ,songDuration ,imageURL ,path ,albumTitle) values ('%@','%@','%@','%@','%@')",model.songName,model.songDuration,model.imageURL,model.path,model.albumTitle];
    BOOL result = [self.db executeUpdate:sqlStr];
    if (result) {
        NSLog(@"添加成功!");
    }else{
        NSLog(@"添加失败!");
    }
    [self.db close];
    
    
}

-(void)deleteSongWithSongName:(NSString *)songName{
    [self.db open];
    NSString *sqlStr = [NSString stringWithFormat:@"delete from SongDownload where songName = '%@'",songName];
    BOOL result = [self.db executeUpdate:sqlStr];
    if (result) {
        NSLog(@"删除成功!");
    }else{
        NSLog(@"删除失败!");
    }
    [self.db close];
    
    
}

-(NSArray<DownloadModel *> *)selectAllSong{
    
    [self.db open];
    NSString *sqlStr = @"select * from SongDownload";
    
    NSMutableArray *mArr = [NSMutableArray array];
    FMResultSet *allResult = [self.db executeQuery:sqlStr];
    while ([allResult next]) {
        DownloadModel *model = [[DownloadModel alloc] init];
        model.songName = [allResult objectForColumnName:@"songName"];
        model.imageURL = [allResult objectForColumnName:@"imageURL"];
       model.path = [allResult objectForColumnName:@"path"];
       model.songDuration = [allResult objectForColumnName:@"songDuration"];
        model.albumTitle = [allResult objectForColumnName:@"albumTitle"];
    
        [mArr addObject:model];
        
        
    }
    [self.db close];
    return mArr;
    
}






@end
