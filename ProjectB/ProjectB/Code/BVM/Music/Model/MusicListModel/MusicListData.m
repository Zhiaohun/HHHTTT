//
//  MusicListData.m
//
//  Created by   on 2016/10/7
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MusicListData.h"
#import "MusicListTracks.h"
#import "MusicListAlbum.h"
#import "MusicListUser.h"


NSString *const kMusicListDataViewTab = @"viewTab";
NSString *const kMusicListDataTracks = @"tracks";
NSString *const kMusicListDataShowFeedButton = @"showFeedButton";
NSString *const kMusicListDataAlbum = @"album";
NSString *const kMusicListDataUser = @"user";


@interface MusicListData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MusicListData

@synthesize viewTab = _viewTab;
@synthesize tracks = _tracks;
@synthesize showFeedButton = _showFeedButton;
@synthesize album = _album;
@synthesize user = _user;


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
            self.viewTab = [self objectOrNilForKey:kMusicListDataViewTab fromDictionary:dict];
            self.tracks = [MusicListTracks modelObjectWithDictionary:[dict objectForKey:kMusicListDataTracks]];
            self.showFeedButton = [[self objectOrNilForKey:kMusicListDataShowFeedButton fromDictionary:dict] boolValue];
            self.album = [MusicListAlbum modelObjectWithDictionary:[dict objectForKey:kMusicListDataAlbum]];
            self.user = [MusicListUser modelObjectWithDictionary:[dict objectForKey:kMusicListDataUser]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.viewTab forKey:kMusicListDataViewTab];
    [mutableDict setValue:[self.tracks dictionaryRepresentation] forKey:kMusicListDataTracks];
    [mutableDict setValue:[NSNumber numberWithBool:self.showFeedButton] forKey:kMusicListDataShowFeedButton];
    [mutableDict setValue:[self.album dictionaryRepresentation] forKey:kMusicListDataAlbum];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kMusicListDataUser];

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

    self.viewTab = [aDecoder decodeObjectForKey:kMusicListDataViewTab];
    self.tracks = [aDecoder decodeObjectForKey:kMusicListDataTracks];
    self.showFeedButton = [aDecoder decodeBoolForKey:kMusicListDataShowFeedButton];
    self.album = [aDecoder decodeObjectForKey:kMusicListDataAlbum];
    self.user = [aDecoder decodeObjectForKey:kMusicListDataUser];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_viewTab forKey:kMusicListDataViewTab];
    [aCoder encodeObject:_tracks forKey:kMusicListDataTracks];
    [aCoder encodeBool:_showFeedButton forKey:kMusicListDataShowFeedButton];
    [aCoder encodeObject:_album forKey:kMusicListDataAlbum];
    [aCoder encodeObject:_user forKey:kMusicListDataUser];
}

- (id)copyWithZone:(NSZone *)zone
{
    MusicListData *copy = [[MusicListData alloc] init];
    
    if (copy) {

        copy.viewTab = [self.viewTab copyWithZone:zone];
        copy.tracks = [self.tracks copyWithZone:zone];
        copy.showFeedButton = self.showFeedButton;
        copy.album = [self.album copyWithZone:zone];
        copy.user = [self.user copyWithZone:zone];
    }
    
    return copy;
}


@end
