//
//  SongDownloadManager.h
//  ProjectB
//
//  Created by long on 2016/10/12.
//  Copyright © 2016年 long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownLoad.h"

@interface SongDownloadManager : NSObject
@property (nonatomic, strong) NSMutableDictionary *songDic;

+(instancetype)defaultManager;
-(DownLoad *)addDownloadTaskWithURL:(NSString *)URLStr;

@end
