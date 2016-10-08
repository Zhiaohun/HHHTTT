//
//  MusicListTracks.m
//
//  Created by   on 2016/10/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MusicListTracks.h"
#import "MusicListList.h"


NSString *const kMusicListTracksMaxPageId = @"maxPageId";
NSString *const kMusicListTracksList = @"list";
NSString *const kMusicListTracksPageId = @"pageId";
NSString *const kMusicListTracksPageSize = @"pageSize";
NSString *const kMusicListTracksTotalCount = @"totalCount";


@interface MusicListTracks ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MusicListTracks

@synthesize maxPageId = _maxPageId;
@synthesize list = _list;
@synthesize pageId = _pageId;
@synthesize pageSize = _pageSize;
@synthesize totalCount = _totalCount;


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
            self.maxPageId = [[self objectOrNilForKey:kMusicListTracksMaxPageId fromDictionary:dict] doubleValue];
    NSObject *receivedMusicListList = [dict objectForKey:kMusicListTracksList];
    NSMutableArray *parsedMusicListList = [NSMutableArray array];
    if ([receivedMusicListList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMusicListList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMusicListList addObject:[MusicListList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMusicListList isKindOfClass:[NSDictionary class]]) {
       [parsedMusicListList addObject:[MusicListList modelObjectWithDictionary:(NSDictionary *)receivedMusicListList]];
    }

    self.list = [NSArray arrayWithArray:parsedMusicListList];
            self.pageId = [[self objectOrNilForKey:kMusicListTracksPageId fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kMusicListTracksPageSize fromDictionary:dict] doubleValue];
            self.totalCount = [[self objectOrNilForKey:kMusicListTracksTotalCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maxPageId] forKey:kMusicListTracksMaxPageId];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.list) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kMusicListTracksList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageId] forKey:kMusicListTracksPageId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kMusicListTracksPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalCount] forKey:kMusicListTracksTotalCount];

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

    self.maxPageId = [aDecoder decodeDoubleForKey:kMusicListTracksMaxPageId];
    self.list = [aDecoder decodeObjectForKey:kMusicListTracksList];
    self.pageId = [aDecoder decodeDoubleForKey:kMusicListTracksPageId];
    self.pageSize = [aDecoder decodeDoubleForKey:kMusicListTracksPageSize];
    self.totalCount = [aDecoder decodeDoubleForKey:kMusicListTracksTotalCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_maxPageId forKey:kMusicListTracksMaxPageId];
    [aCoder encodeObject:_list forKey:kMusicListTracksList];
    [aCoder encodeDouble:_pageId forKey:kMusicListTracksPageId];
    [aCoder encodeDouble:_pageSize forKey:kMusicListTracksPageSize];
    [aCoder encodeDouble:_totalCount forKey:kMusicListTracksTotalCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    MusicListTracks *copy = [[MusicListTracks alloc] init];
    
    if (copy) {

        copy.maxPageId = self.maxPageId;
        copy.list = [self.list copyWithZone:zone];
        copy.pageId = self.pageId;
        copy.pageSize = self.pageSize;
        copy.totalCount = self.totalCount;
    }
    
    return copy;
}


@end
