//
//  VideoListData.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VideoListAuthor, VideoListCover, VideoListConsumption, VideoListLabel, VideoListProvider, VideoListWebUrl;

@interface VideoListData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) VideoListAuthor *author;
@property (nonatomic, strong) NSString *dataDescription;
@property (nonatomic, assign) double releaseTime;
@property (nonatomic, strong) NSString *dataType;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) id webAdTrack;
@property (nonatomic, strong) NSArray *playInfo;
@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, assign) double duration;
@property (nonatomic, assign) double idx;
@property (nonatomic, assign) id favoriteAdTrack;
@property (nonatomic, assign) BOOL collected;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) VideoListCover *cover;
@property (nonatomic, strong) VideoListConsumption *consumption;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) id waterMarks;
@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, assign) double date;
@property (nonatomic, strong) VideoListLabel *label;
@property (nonatomic, strong) NSString *playUrl;
@property (nonatomic, assign) id promotion;
@property (nonatomic, strong) VideoListProvider *provider;
@property (nonatomic, assign) id adTrack;
@property (nonatomic, assign) id campaign;
@property (nonatomic, assign) id shareAdTrack;
@property (nonatomic, strong) VideoListWebUrl *webUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
