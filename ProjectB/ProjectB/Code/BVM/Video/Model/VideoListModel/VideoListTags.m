//
//  VideoListTags.m
//
//  Created by   on 2016/9/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VideoListTags.h"


NSString *const kVideoListTagsId = @"id";
NSString *const kVideoListTagsActionUrl = @"actionUrl";
NSString *const kVideoListTagsName = @"name";
NSString *const kVideoListTagsAdTrack = @"adTrack";


@interface VideoListTags ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VideoListTags

@synthesize tagsIdentifier = _tagsIdentifier;
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
            self.tagsIdentifier = [[self objectOrNilForKey:kVideoListTagsId fromDictionary:dict] doubleValue];
            self.actionUrl = [self objectOrNilForKey:kVideoListTagsActionUrl fromDictionary:dict];
            self.name = [self objectOrNilForKey:kVideoListTagsName fromDictionary:dict];
            self.adTrack = [self objectOrNilForKey:kVideoListTagsAdTrack fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tagsIdentifier] forKey:kVideoListTagsId];
    [mutableDict setValue:self.actionUrl forKey:kVideoListTagsActionUrl];
    [mutableDict setValue:self.name forKey:kVideoListTagsName];
    [mutableDict setValue:self.adTrack forKey:kVideoListTagsAdTrack];

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

    self.tagsIdentifier = [aDecoder decodeDoubleForKey:kVideoListTagsId];
    self.actionUrl = [aDecoder decodeObjectForKey:kVideoListTagsActionUrl];
    self.name = [aDecoder decodeObjectForKey:kVideoListTagsName];
    self.adTrack = [aDecoder decodeObjectForKey:kVideoListTagsAdTrack];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_tagsIdentifier forKey:kVideoListTagsId];
    [aCoder encodeObject:_actionUrl forKey:kVideoListTagsActionUrl];
    [aCoder encodeObject:_name forKey:kVideoListTagsName];
    [aCoder encodeObject:_adTrack forKey:kVideoListTagsAdTrack];
}

- (id)copyWithZone:(NSZone *)zone
{
    VideoListTags *copy = [[VideoListTags alloc] init];
    
    if (copy) {

        copy.tagsIdentifier = self.tagsIdentifier;
        copy.actionUrl = [self.actionUrl copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.adTrack = [self.adTrack copyWithZone:zone];
    }
    
    return copy;
}


@end
