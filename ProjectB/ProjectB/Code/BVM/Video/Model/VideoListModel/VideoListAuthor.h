//
//  VideoListAuthor.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VideoListAuthor : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double videoNum;
@property (nonatomic, assign) double latestReleaseTime;
@property (nonatomic, assign) double authorIdentifier;
@property (nonatomic, assign) id adTrack;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *authorDescription;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
