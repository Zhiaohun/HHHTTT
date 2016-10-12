//
//  DownLoad.h
//  ProjectA
//
//  Created by long on 16/9/22.
//  Copyright © 2016年 long. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^DownLoadProgressBlock)(int);
typedef void(^DownLoadPathBlock)(NSString *);

@interface DownLoad : NSObject
@property (nonatomic, copy) DownLoadProgressBlock downLoadProgressBlock;
@property (nonatomic, copy) DownLoadPathBlock downLoadPathBlock;

-(id)initDownLoadTaskWithURL:(NSString *)URL;

//开始下载
-(void)startDownLoad;

//暂停下载
-(void)stopDownLoad;

@end
