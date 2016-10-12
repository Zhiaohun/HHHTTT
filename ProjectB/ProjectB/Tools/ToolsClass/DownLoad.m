//
//  DownLoad.m
//  ProjectA
//
//  Created by long on 16/9/22.
//  Copyright © 2016年 long. All rights reserved.
//

#import "DownLoad.h"

@interface DownLoad()<NSURLSessionDownloadDelegate>
@property (nonatomic, strong) NSURLSessionDownloadTask *task;

@end

@implementation DownLoad


-(id)initDownLoadTaskWithURL:(NSString *)URL{
    self = [super init];
    if (self) {
        NSURLSessionConfiguration  *cf = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:cf delegate:self delegateQueue:[NSOperationQueue mainQueue]];
        _task = [session downloadTaskWithURL:[NSURL URLWithString:URL]];
    }
    return self;
}



//开始下载
-(void)startDownLoad{
    [_task resume];
}

//暂停下载
-(void)stopDownLoad{
    [_task suspend];
}


#pragma mark - Delegate


//下载完成时才会被调用
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    NSString *cachePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    NSLog(@">>>>>>>%@",cachePath);
    NSString *filePath = [cachePath stringByAppendingPathComponent:downloadTask.response.suggestedFilename];
   
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager createFileAtPath:filePath contents:nil attributes:nil];
    NSError *error;
    [fileManager moveItemAtPath:location.path toPath:filePath error:&error];
    NSLog(@"______%@",error);
     NSLog(@"_+_+_+_+_______________________________%@",filePath);
    NSArray *arr = [filePath componentsSeparatedByString:@"/"];
    filePath = [arr lastObject];
    
    if (self.downLoadPathBlock) {
        self.downLoadPathBlock(filePath);
    }
}


//会一直被调用
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    float progress = (float)totalBytesWritten / totalBytesExpectedToWrite;
    int intProgress = progress * 100;
    NSLog(@"_____%f",progress);
    if (self.downLoadProgressBlock) {
        self.downLoadProgressBlock(intProgress);
    }
}
@end
