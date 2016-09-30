//
//  VideoListBaseClass.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VideoListTag;

@interface VideoListBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *nextPageUrl;
@property (nonatomic, assign) double count;
@property (nonatomic, strong) NSArray *itemList;
@property (nonatomic, assign) double total;
@property (nonatomic, strong) VideoListTag *tag;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
