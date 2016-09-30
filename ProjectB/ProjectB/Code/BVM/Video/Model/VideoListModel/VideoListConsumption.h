//
//  VideoListConsumption.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VideoListConsumption : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double replyCount;
@property (nonatomic, assign) double shareCount;
@property (nonatomic, assign) double collectionCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
