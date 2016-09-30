//
//  VideoListCover.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VideoListCover.h"


NSString *const kVideoListCoverBlurred = @"blurred";
NSString *const kVideoListCoverSharing = @"sharing";
NSString *const kVideoListCoverFeed = @"feed";
NSString *const kVideoListCoverDetail = @"detail";


@interface VideoListCover ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VideoListCover

@synthesize blurred = _blurred;
@synthesize sharing = _sharing;
@synthesize feed = _feed;
@synthesize detail = _detail;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.blurred = [self objectOrNilForKey:kVideoListCoverBlurred fromDictionary:dict];
            self.sharing = [self objectOrNilForKey:kVideoListCoverSharing fromDictionary:dict];
            self.feed = [self objectOrNilForKey:kVideoListCoverFeed fromDictionary:dict];
            self.detail = [self objectOrNilForKey:kVideoListCoverDetail fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.blurred forKey:kVideoListCoverBlurred];
    [mutableDict setValue:self.sharing forKey:kVideoListCoverSharing];
    [mutableDict setValue:self.feed forKey:kVideoListCoverFeed];
    [mutableDict setValue:self.detail forKey:kVideoListCoverDetail];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.blurred = [aDecoder decodeObjectForKey:kVideoListCoverBlurred];
    self.sharing = [aDecoder decodeObjectForKey:kVideoListCoverSharing];
    self.feed = [aDecoder decodeObjectForKey:kVideoListCoverFeed];
    self.detail = [aDecoder decodeObjectForKey:kVideoListCoverDetail];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_blurred forKey:kVideoListCoverBlurred];
    [aCoder encodeObject:_sharing forKey:kVideoListCoverSharing];
    [aCoder encodeObject:_feed forKey:kVideoListCoverFeed];
    [aCoder encodeObject:_detail forKey:kVideoListCoverDetail];
}

- (id)copyWithZone:(NSZone *)zone
{
    VideoListCover *copy = [[VideoListCover alloc] init];
    
    if (copy) {

        copy.blurred = [self.blurred copyWithZone:zone];
        copy.sharing = [self.sharing copyWithZone:zone];
        copy.feed = [self.feed copyWithZone:zone];
        copy.detail = [self.detail copyWithZone:zone];
    }
    
    return copy;
}


@end
