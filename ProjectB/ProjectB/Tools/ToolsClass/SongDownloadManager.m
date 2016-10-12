//
//  SongDownloadManager.m
//  ProjectB
//
//  Created by long on 2016/10/12.
//  Copyright © 2016年 long. All rights reserved.
//

#import "SongDownloadManager.h"

@implementation SongDownloadManager

+(instancetype)defaultManager{
    static SongDownloadManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[SongDownloadManager alloc] init];
    });
    return manager;
}


-(NSDictionary *)songDic{
    if (!_songDic) {
        _songDic = [NSMutableDictionary dictionary];
    }
    return _songDic;
}
-(DownLoad *)addDownloadTaskWithURL:(NSString *)URLStr{
    DownLoad *download = self.songDic[URLStr];
    if (!download) {
        download = [[DownLoad alloc] initDownLoadTaskWithURL:URLStr];
        [self.songDic setObject:download forKey:URLStr];
        
    }
    return download;
    
}


@end
