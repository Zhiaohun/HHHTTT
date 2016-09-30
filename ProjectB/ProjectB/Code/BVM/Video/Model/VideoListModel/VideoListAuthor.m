//
//  VideoListAuthor.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VideoListAuthor.h"


NSString *const kVideoListAuthorVideoNum = @"videoNum";
NSString *const kVideoListAuthorLatestReleaseTime = @"latestReleaseTime";
NSString *const kVideoListAuthorId = @"id";
NSString *const kVideoListAuthorAdTrack = @"adTrack";
NSString *const kVideoListAuthorLink = @"link";
NSString *const kVideoListAuthorDescription = @"description";
NSString *const kVideoListAuthorIcon = @"icon";
NSString *const kVideoListAuthorName = @"name";


@interface VideoListAuthor ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VideoListAuthor

@synthesize videoNum = _videoNum;
@synthesize latestReleaseTime = _latestReleaseTime;
@synthesize authorIdentifier = _authorIdentifier;
@synthesize adTrack = _adTrack;
@synthesize link = _link;
@synthesize authorDescription = _authorDescription;
@synthesize icon = _icon;
@synthesize name = _name;


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
            self.videoNum = [[self objectOrNilForKey:kVideoListAuthorVideoNum fromDictionary:dict] doubleValue];
            self.latestReleaseTime = [[self objectOrNilForKey:kVideoListAuthorLatestReleaseTime fromDictionary:dict] doubleValue];
            self.authorIdentifier = [[self objectOrNilForKey:kVideoListAuthorId fromDictionary:dict] doubleValue];
            self.adTrack = [self objectOrNilForKey:kVideoListAuthorAdTrack fromDictionary:dict];
            self.link = [self objectOrNilForKey:kVideoListAuthorLink fromDictionary:dict];
            self.authorDescription = [self objectOrNilForKey:kVideoListAuthorDescription fromDictionary:dict];
            self.icon = [self objectOrNilForKey:kVideoListAuthorIcon fromDictionary:dict];
            self.name = [self objectOrNilForKey:kVideoListAuthorName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.videoNum] forKey:kVideoListAuthorVideoNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.latestReleaseTime] forKey:kVideoListAuthorLatestReleaseTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.authorIdentifier] forKey:kVideoListAuthorId];
    [mutableDict setValue:self.adTrack forKey:kVideoListAuthorAdTrack];
    [mutableDict setValue:self.link forKey:kVideoListAuthorLink];
    [mutableDict setValue:self.authorDescription forKey:kVideoListAuthorDescription];
    [mutableDict setValue:self.icon forKey:kVideoListAuthorIcon];
    [mutableDict setValue:self.name forKey:kVideoListAuthorName];

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

    self.videoNum = [aDecoder decodeDoubleForKey:kVideoListAuthorVideoNum];
    self.latestReleaseTime = [aDecoder decodeDoubleForKey:kVideoListAuthorLatestReleaseTime];
    self.authorIdentifier = [aDecoder decodeDoubleForKey:kVideoListAuthorId];
    self.adTrack = [aDecoder decodeObjectForKey:kVideoListAuthorAdTrack];
    self.link = [aDecoder decodeObjectForKey:kVideoListAuthorLink];
    self.authorDescription = [aDecoder decodeObjectForKey:kVideoListAuthorDescription];
    self.icon = [aDecoder decodeObjectForKey:kVideoListAuthorIcon];
    self.name = [aDecoder decodeObjectForKey:kVideoListAuthorName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_videoNum forKey:kVideoListAuthorVideoNum];
    [aCoder encodeDouble:_latestReleaseTime forKey:kVideoListAuthorLatestReleaseTime];
    [aCoder encodeDouble:_authorIdentifier forKey:kVideoListAuthorId];
    [aCoder encodeObject:_adTrack forKey:kVideoListAuthorAdTrack];
    [aCoder encodeObject:_link forKey:kVideoListAuthorLink];
    [aCoder encodeObject:_authorDescription forKey:kVideoListAuthorDescription];
    [aCoder encodeObject:_icon forKey:kVideoListAuthorIcon];
    [aCoder encodeObject:_name forKey:kVideoListAuthorName];
}

- (id)copyWithZone:(NSZone *)zone
{
    VideoListAuthor *copy = [[VideoListAuthor alloc] init];
    
    if (copy) {

        copy.videoNum = self.videoNum;
        copy.latestReleaseTime = self.latestReleaseTime;
        copy.authorIdentifier = self.authorIdentifier;
        copy.adTrack = [self.adTrack copyWithZone:zone];
        copy.link = [self.link copyWithZone:zone];
        copy.authorDescription = [self.authorDescription copyWithZone:zone];
        copy.icon = [self.icon copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
