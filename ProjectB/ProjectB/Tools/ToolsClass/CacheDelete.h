//
//  CacheDelete.h
//  ProjectB
//
//  Created by long on 2016/10/10.
//  Copyright © 2016年 long. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheDelete : NSObject

//计算单个文件大小
+(float)fileSizeAtPath:(NSString *)path;

//计算目录大小
+(float)folderSizeAtPath:(NSString *)path;

//清理缓存文件
+(void)clearCache:(NSString *)path;
@end
