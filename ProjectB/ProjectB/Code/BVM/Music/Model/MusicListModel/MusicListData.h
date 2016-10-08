//
//  MusicListData.h
//
//  Created by   on 2016/10/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MusicListTracks, MusicListAlbum, MusicListUser;

@interface MusicListData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *viewTab;
@property (nonatomic, strong) MusicListTracks *tracks;
@property (nonatomic, assign) BOOL showFeedButton;
@property (nonatomic, strong) MusicListAlbum *album;
@property (nonatomic, strong) MusicListUser *user;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
