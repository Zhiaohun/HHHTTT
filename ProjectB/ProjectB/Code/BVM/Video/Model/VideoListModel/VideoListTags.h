//
//  VideoListTags.h
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface VideoListTags : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double tagsIdentifier;
@property (nonatomic, strong) NSString *actionUrl;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) id adTrack;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
