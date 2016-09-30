//
//  VideoListTag.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VideoListTag.h"


NSString *const kVideoListTagId = @"id";
NSString *const kVideoListTagActionUrl = @"actionUrl";
NSString *const kVideoListTagName = @"name";
NSString *const kVideoListTagAdTrack = @"adTrack";


@interface VideoListTag ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VideoListTag

@synthesize tagIdentifier = _tagIdentifier;
@synthesize actionUrl = _actionUrl;
@synthesize name = _name;
@synthesize adTrack = _adTrack;


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
            self.tagIdentifier = [[self objectOrNilForKey:kVideoListTagId fromDictionary:dict] doubleValue];
            self.actionUrl = [self objectOrNilForKey:kVideoListTagActionUrl fromDictionary:dict];
            self.name = [self objectOrNilForKey:kVideoListTagName fromDictionary:dict];
            self.adTrack = [self objectOrNilForKey:kVideoListTagAdTrack fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tagIdentifier] forKey:kVideoListTagId];
    [mutableDict setValue:self.actionUrl forKey:kVideoListTagActionUrl];
    [mutableDict setValue:self.name forKey:kVideoListTagName];
    [mutableDict setValue:self.adTrack forKey:kVideoListTagAdTrack];

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

    self.tagIdentifier = [aDecoder decodeDoubleForKey:kVideoListTagId];
    self.actionUrl = [aDecoder decodeObjectForKey:kVideoListTagActionUrl];
    self.name = [aDecoder decodeObjectForKey:kVideoListTagName];
    self.adTrack = [aDecoder decodeObjectForKey:kVideoListTagAdTrack];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_tagIdentifier forKey:kVideoListTagId];
    [aCoder encodeObject:_actionUrl forKey:kVideoListTagActionUrl];
    [aCoder encodeObject:_name forKey:kVideoListTagName];
    [aCoder encodeObject:_adTrack forKey:kVideoListTagAdTrack];
}

- (id)copyWithZone:(NSZone *)zone
{
    VideoListTag *copy = [[VideoListTag alloc] init];
    
    if (copy) {

        copy.tagIdentifier = self.tagIdentifier;
        copy.actionUrl = [self.actionUrl copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.adTrack = [self.adTrack copyWithZone:zone];
    }
    
    return copy;
}


@end
