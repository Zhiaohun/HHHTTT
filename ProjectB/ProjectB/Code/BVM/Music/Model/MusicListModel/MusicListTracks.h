//
//  MusicListTracks.h
//
//  Created by   on 2016/10/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MusicListTracks : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double maxPageId;
@property (nonatomic, strong) NSArray *list;
@property (nonatomic, assign) double pageId;
@property (nonatomic, assign) double pageSize;
@property (nonatomic, assign) double totalCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
