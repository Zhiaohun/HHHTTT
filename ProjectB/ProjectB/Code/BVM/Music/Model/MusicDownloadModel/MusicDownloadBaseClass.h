//
//  MusicDownloadBaseClass.h
//
//  Created by   on 2016/10/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MusicDownloadBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL isFree;
@property (nonatomic, strong) NSString *albumCoverMiddle;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double duration;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, assign) BOOL isPaid;
@property (nonatomic, assign) BOOL isAuthorized;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, strong) NSString *smallLogo;
@property (nonatomic, assign) double orderNum;
@property (nonatomic, strong) NSString *albumTitle;
@property (nonatomic, strong) NSString *albumCoverSmall;
@property (nonatomic, assign) double downloadSize;
@property (nonatomic, assign) double downloadType;
@property (nonatomic, assign) double albumId;
@property (nonatomic, assign) double timeline;
@property (nonatomic, strong) NSString *coverSmall;
@property (nonatomic, assign) double downloadTime;
@property (nonatomic, assign) double uid;
@property (nonatomic, assign) double downloadAacSize;
@property (nonatomic, strong) NSString *downloadAacUrl;
@property (nonatomic, strong) NSString *sequnceId;
@property (nonatomic, strong) NSString *downloadUrl;
@property (nonatomic, assign) double ret;
@property (nonatomic, assign) double trackId;
@property (nonatomic, strong) NSString *msg;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
