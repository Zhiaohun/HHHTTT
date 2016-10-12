//
//  DownloadModel.h
//  ProjectB
//
//  Created by long on 2016/10/12.
//  Copyright © 2016年 long. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownloadModel : NSObject

@property (nonatomic, strong) NSString *songName;
@property (nonatomic, strong) NSString *songDuration;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSString *albumTitle;

@end
